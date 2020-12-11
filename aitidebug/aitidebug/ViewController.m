//
//  ViewController.m
//  aitidebug
//
//  Created by administrator on 2020/12/12.
//

#import "ViewController.h"
#import <mach-o/loader.h>
#import <mach-o/dyld.h>

#define CPU_SUBTYPES_SUPPORTED  ((__arm__ || __arm64__ || __x86_64__) && !TARGET_OS_SIMULATOR)

#if __LP64__
    #define macho_header              mach_header_64
    #define LC_SEGMENT_COMMAND        LC_SEGMENT_64
    #define LC_SEGMENT_COMMAND_WRONG LC_SEGMENT
    #define LC_ENCRYPT_COMMAND        LC_ENCRYPTION_INFO
    #define macho_segment_command    segment_command_64
    #define macho_section            section_64
#else
    #define macho_header              mach_header
    #define LC_SEGMENT_COMMAND        LC_SEGMENT
    #define LC_SEGMENT_COMMAND_WRONG LC_SEGMENT_64
    #define LC_ENCRYPT_COMMAND        LC_ENCRYPTION_INFO_64
    #define macho_segment_command    segment_command
    #define macho_section            section
#endif

@interface ViewController ()

@end

@implementation ViewController

static bool hasRestrictedSegment(const struct macho_header* mh)
{
    const uint32_t cmd_count = mh->ncmds;
    const struct load_command* const cmds = (struct load_command*)(((char*)mh)+sizeof(struct macho_header));
    const struct load_command* cmd = cmds;
    for (uint32_t i = 0; i < cmd_count; ++i) {
        switch (cmd->cmd) {
            case LC_SEGMENT_COMMAND:
            {
                const struct macho_segment_command* seg = (struct macho_segment_command*)cmd;
                
                //dyld::log("seg name: %s\n", seg->segname);
                if (strcmp(seg->segname, "__RESTRICT") == 0) {
                    const struct macho_section* const sectionsStart = (struct macho_section*)((char*)seg + sizeof(struct macho_segment_command));
                    const struct macho_section* const sectionsEnd = &sectionsStart[seg->nsects];
                    for (const struct macho_section* sect=sectionsStart; sect < sectionsEnd; ++sect) {
                        if (strcmp(sect->sectname, "__restrict") == 0)
                            return true;
                    }
                }
            }
            break;
        }
        cmd = (const struct load_command*)(((char*)cmd)+cmd->cmdsize);
    }
        
    return false;
}

+ (void)load{
    //DYLD启动App的时候，最先加载的是自己的MachO（通过LLDB:image list 查看角标）
    struct mach_header *header = _dyld_get_image_header(0);
//    NSLog(@"%@",header);
    if (hasRestrictedSegment(header)) {
        NSLog(@"防护没变化");
    }else{
        NSLog(@"哥们修改我二进制干啥");
        exit(0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
