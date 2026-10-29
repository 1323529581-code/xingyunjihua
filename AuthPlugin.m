#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <dlfcn.h>

static NSString * const kKeyActiveCode = @"ActiveAuthCode";
static NSString * const kKeyActiveDevice = @"ActiveAuthDevice";
static NSString * const kKeyActivationTime = @"ActiveAuthTime";
static NSString * const kKeyCodeType = @"ActiveCodeType";

static NSArray *getAuthDatabase() {
    static NSArray *database = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        database = @[
            // ===== 星陨计划 日卡 (100) =====
            @{@"code": @"DAY-09Z9G-KLYDY", @"type": @"日卡"}, @{@"code": @"DAY-0PHAW-1JTLT", @"type": @"日卡"}, @{@"code": @"DAY-0UFFE-EZDA9", @"type": @"日卡"}, @{@"code": @"DAY-15JLV-DNMDA", @"type": @"日卡"}, @{@"code": @"DAY-1LVEN-VHJCI", @"type": @"日卡"}, @{@"code": @"DAY-1N9WT-2KUAN", @"type": @"日卡"}, @{@"code": @"DAY-2G5Q5-DOFY1", @"type": @"日卡"}, @{@"code": @"DAY-2R65L-FKKMP", @"type": @"日卡"}, @{@"code": @"DAY-32CBF-RP56B", @"type": @"日卡"}, @{@"code": @"DAY-40V3C-RT95O", @"type": @"日卡"},
            @{@"code": @"DAY-4AS7U-XW28N", @"type": @"日卡"}, @{@"code": @"DAY-4N1NI-ZIVN2", @"type": @"日卡"}, @{@"code": @"DAY-50KX9-S85B0", @"type": @"日卡"}, @{@"code": @"DAY-5A3NW-AJK1H", @"type": @"日卡"}, @{@"code": @"DAY-5BU3G-EDMXR", @"type": @"日卡"}, @{@"code": @"DAY-5DCME-TSUI8", @"type": @"日卡"}, @{@"code": @"DAY-5N7L2-307FW", @"type": @"日卡"}, @{@"code": @"DAY-66KWS-ZOLX7", @"type": @"日卡"}, @{@"code": @"DAY-6AK3N-BZ8W4", @"type": @"日卡"}, @{@"code": @"DAY-7DY3V-ZFIZR", @"type": @"日卡"},
            @{@"code": @"DAY-7T9IX-KKTWY", @"type": @"日卡"}, @{@"code": @"DAY-8GVKM-PACT6", @"type": @"日卡"}, @{@"code": @"DAY-8O478-185H8", @"type": @"日卡"}, @{@"code": @"DAY-8UAXV-00YDO", @"type": @"日卡"}, @{@"code": @"DAY-93O8C-GSUEN", @"type": @"日卡"}, @{@"code": @"DAY-98OO5-AB0X6", @"type": @"日卡"}, @{@"code": @"DAY-9BHY0-FZV3M", @"type": @"日卡"}, @{@"code": @"DAY-9PBAO-25C79", @"type": @"日卡"}, @{@"code": @"DAY-9Q9C2-OUWUR", @"type": @"日卡"}, @{@"code": @"DAY-9W51H-YFSUR", @"type": @"日卡"},
            @{@"code": @"DAY-9XEXN-SHK34", @"type": @"日卡"}, @{@"code": @"DAY-ALF6P-H45BV", @"type": @"日卡"}, @{@"code": @"DAY-AX363-KKZ58", @"type": @"日卡"}, @{@"code": @"DAY-B5FWS-LUKSB", @"type": @"日卡"}, @{@"code": @"DAY-BI2DJ-IJ1VA", @"type": @"日卡"}, @{@"code": @"DAY-BZHIW-SOH27", @"type": @"日卡"}, @{@"code": @"DAY-C1Z1Q-NI8CT", @"type": @"日卡"}, @{@"code": @"DAY-CERWM-I7K8G", @"type": @"日卡"}, @{@"code": @"DAY-CHO6N-S1MI6", @"type": @"日卡"}, @{@"code": @"DAY-CKUJV-ERS50", @"type": @"日卡"},
            @{@"code": @"DAY-CM73L-VLIW6", @"type": @"日卡"}, @{@"code": @"DAY-CNOF9-Z6J7C", @"type": @"日卡"}, @{@"code": @"DAY-D01M0-ZRCTW", @"type": @"日卡"}, @{@"code": @"DAY-DKT5B-35AVF", @"type": @"日卡"}, @{@"code": @"DAY-DNR1E-RQ4T8", @"type": @"日卡"}, @{@"code": @"DAY-E8ZCN-Z2JIB", @"type": @"日卡"}, @{@"code": @"DAY-EUIT6-AM0H5", @"type": @"日卡"}, @{@"code": @"DAY-F15U3-6THM2", @"type": @"日卡"}, @{@"code": @"DAY-FON6L-F2DM7", @"type": @"日卡"}, @{@"code": @"DAY-FTQB2-67WO5", @"type": @"日卡"},
            @{@"code": @"DAY-G8CNI-X2YAH", @"type": @"日卡"}, @{@"code": @"DAY-GU0TM-PQZNP", @"type": @"日卡"}, @{@"code": @"DAY-IRVTH-ACMEY", @"type": @"日卡"}, @{@"code": @"DAY-JC7AQ-1AX6R", @"type": @"日卡"}, @{@"code": @"DAY-K6U4D-EDZ6G", @"type": @"日卡"}, @{@"code": @"DAY-KFUHC-K3RHG", @"type": @"日卡"}, @{@"code": @"DAY-KHQU4-61J0N", @"type": @"日卡"}, @{@"code": @"DAY-KQ1AT-55AVN", @"type": @"日卡"}, @{@"code": @"DAY-KZZDN-JX42S", @"type": @"日卡"}, @{@"code": @"DAY-L6XCD-ANCH3", @"type": @"日卡"},
            @{@"code": @"DAY-L9LSM-L6GWV", @"type": @"日卡"}, @{@"code": @"DAY-LBWSS-DHS5H", @"type": @"日卡"}, @{@"code": @"DAY-M12P8-ST7XW", @"type": @"日卡"}, @{@"code": @"DAY-MCJKC-LNNPQ", @"type": @"日卡"}, @{@"code": @"DAY-MEII0-FJPHK", @"type": @"日卡"}, @{@"code": @"DAY-MU2TT-B69XZ", @"type": @"日卡"}, @{@"code": @"DAY-N2LFD-LGUQJ", @"type": @"日卡"}, @{@"code": @"DAY-NADOL-Q8EO9", @"type": @"日卡"}, @{@"code": @"DAY-NB2CI-H5NUB", @"type": @"日卡"}, @{@"code": @"DAY-NKNMN-P36NO", @"type": @"日卡"},
            @{@"code": @"DAY-NVGPM-X4GUV", @"type": @"日卡"}, @{@"code": @"DAY-OZTH0-M2180", @"type": @"日卡"}, @{@"code": @"DAY-P2JSO-A5NU1", @"type": @"日卡"}, @{@"code": @"DAY-PAR91-X1CP8", @"type": @"日卡"}, @{@"code": @"DAY-PEQ0M-WPMLA", @"type": @"日卡"}, @{@"code": @"DAY-PO01I-HV9BM", @"type": @"日卡"}, @{@"code": @"DAY-PWYGP-AYW3H", @"type": @"日卡"}, @{@"code": @"DAY-QCODU-KUSPQ", @"type": @"日卡"}, @{@"code": @"DAY-QQ360-DA5FX", @"type": @"日卡"}, @{@"code": @"DAY-QW4GX-EKG1Q", @"type": @"日卡"},
            @{@"code": @"DAY-R7X8C-UZRZT", @"type": @"日卡"}, @{@"code": @"DAY-SZ1VM-ZFHU8", @"type": @"日卡"}, @{@"code": @"DAY-T47W4-FPBLO", @"type": @"日卡"}, @{@"code": @"DAY-TEXJV-PI2ZC", @"type": @"日卡"}, @{@"code": @"DAY-TL9QR-Y9GGD", @"type": @"日卡"}, @{@"code": @"DAY-TLYH4-TERKD", @"type": @"日卡"}, @{@"code": @"DAY-U69I8-75MGL", @"type": @"日卡"}, @{@"code": @"DAY-U7RN7-RW9EK", @"type": @"日卡"}, @{@"code": @"DAY-UGUT6-59DP6", @"type": @"日卡"}, @{@"code": @"DAY-UTBBL-8FWMG", @"type": @"日卡"},
            @{@"code": @"DAY-VI1G4-CH6BA", @"type": @"日卡"}, @{@"code": @"DAY-VV4ZT-C0Q2V", @"type": @"日卡"}, @{@"code": @"DAY-VWG78-SSGUE", @"type": @"日卡"}, @{@"code": @"DAY-XAGWB-TAHQQ", @"type": @"日卡"}, @{@"code": @"DAY-XHGRQ-6W356", @"type": @"日卡"}, @{@"code": @"DAY-Y78TZ-ZBHDR", @"type": @"日卡"}, @{@"code": @"DAY-Y9HVN-QWQCP", @"type": @"日卡"}, @{@"code": @"DAY-YX7T2-VQHNO", @"type": @"日卡"}, @{@"code": @"DAY-ZA7RR-41SSC", @"type": @"日卡"}, @{@"code": @"DAY-ZSGUD-WXHXZ", @"type": @"日卡"},

            // ===== 星陨计划 月卡 (100) =====
            @{@"code": @"MON-0389Y-Z3M79", @"type": @"月卡"}, @{@"code": @"MON-0GAX0-URYU8", @"type": @"月卡"}, @{@"code": @"MON-0HO7Q-K2V76", @"type": @"月卡"}, @{@"code": @"MON-0I2KC-5O6IU", @"type": @"月卡"}, @{@"code": @"MON-0RIW0-8A4NS", @"type": @"月卡"}, @{@"code": @"MON-125OO-EGTD6", @"type": @"月卡"}, @{@"code": @"MON-2BROW-1O47E", @"type": @"月卡"}, @{@"code": @"MON-3DYK2-OIK2V", @"type": @"月卡"}, @{@"code": @"MON-3GZAA-362Q6", @"type": @"月卡"}, @{@"code": @"MON-3VA6N-ICQY3", @"type": @"月卡"},
            @{@"code": @"MON-4AKKK-VM4SJ", @"type": @"月卡"}, @{@"code": @"MON-4EBTP-U338L", @"type": @"月卡"}, @{@"code": @"MON-51F4K-NMETS", @"type": @"月卡"}, @{@"code": @"MON-56BS7-CK89O", @"type": @"月卡"}, @{@"code": @"MON-58QLX-XKV2O", @"type": @"月卡"}, @{@"code": @"MON-59WIK-07MVZ", @"type": @"月卡"}, @{@"code": @"MON-5DOLJ-RVPJE", @"type": @"月卡"}, @{@"code": @"MON-5F7AD-25348", @"type": @"月卡"}, @{@"code": @"MON-5VN8K-MRYH4", @"type": @"月卡"}, @{@"code": @"MON-7Z4O4-563MH", @"type": @"月卡"},
            @{@"code": @"MON-8FHKC-4Z5ZM", @"type": @"月卡"}, @{@"code": @"MON-8FXR8-JHW1V", @"type": @"月卡"}, @{@"code": @"MON-8X6OB-8GAYU", @"type": @"月卡"}, @{@"code": @"MON-9FMWL-SIAAN", @"type": @"月卡"}, @{@"code": @"MON-A289K-8A3D3", @"type": @"月卡"}, @{@"code": @"MON-ADEBH-3TZ68", @"type": @"月卡"}, @{@"code": @"MON-AHF14-ITNZ5", @"type": @"月卡"}, @{@"code": @"MON-C2MWZ-2L12H", @"type": @"月卡"}, @{@"code": @"MON-CFCNX-XOARQ", @"type": @"月卡"}, @{@"code": @"MON-CHUZN-QV35S", @"type": @"月卡"},
            @{@"code": @"MON-CL9FJ-3SEQ6", @"type": @"月卡"}, @{@"code": @"MON-CS94B-K1R7L", @"type": @"月卡"}, @{@"code": @"MON-DLAXM-3EAD0", @"type": @"月卡"}, @{@"code": @"MON-E6H6A-EO7S0", @"type": @"月卡"}, @{@"code": @"MON-F4IFA-MJZK9", @"type": @"月卡"}, @{@"code": @"MON-FD2W9-74CJM", @"type": @"月卡"}, @{@"code": @"MON-G2HOK-FLAKG", @"type": @"月卡"}, @{@"code": @"MON-GDL26-W1DRT", @"type": @"月卡"}, @{@"code": @"MON-GNEAE-WGC8Q", @"type": @"月卡"}, @{@"code": @"MON-GP4Z3-99V7W", @"type": @"月卡"},
            @{@"code": @"MON-GR4KX-XOP8G", @"type": @"月卡"}, @{@"code": @"MON-GS3I6-6W5UM", @"type": @"月卡"}, @{@"code": @"MON-H58BH-XPP6K", @"type": @"月卡"}, @{@"code": @"MON-H7PIZ-LHU7D", @"type": @"月卡"}, @{@"code": @"MON-HFAAW-BRC5F", @"type": @"月卡"}, @{@"code": @"MON-HOEOG-D42ML", @"type": @"月卡"}, @{@"code": @"MON-HQYQP-X04HB", @"type": @"月卡"}, @{@"code": @"MON-I03PM-WF5ZB", @"type": @"月卡"}, @{@"code": @"MON-I30VF-56SXT", @"type": @"月卡"}, @{@"code": @"MON-IOFVQ-L82MH", @"type": @"月卡"},
            @{@"code": @"MON-J5ZK8-40AYM", @"type": @"月卡"}, @{@"code": @"MON-JA5L0-ZLG0L", @"type": @"月卡"}, @{@"code": @"MON-LH68Z-3510T", @"type": @"月卡"}, @{@"code": @"MON-M79M6-52N7V", @"type": @"月卡"}, @{@"code": @"MON-MFBVD-HYED0", @"type": @"月卡"}, @{@"code": @"MON-MSHN4-N4ZB3", @"type": @"月卡"}, @{@"code": @"MON-MXOOW-NZC6E", @"type": @"月卡"}, @{@"code": @"MON-NP8IM-VMVT5", @"type": @"月卡"}, @{@"code": @"MON-O0AVU-AW476", @"type": @"月卡"}, @{@"code": @"MON-OBATU-CCY8X", @"type": @"月卡"},
            @{@"code": @"MON-PM7PH-Z920E", @"type": @"月卡"}, @{@"code": @"MON-PUTGH-1P062", @"type": @"月卡"}, @{@"code": @"MON-QN3FL-XYEIA", @"type": @"月卡"}, @{@"code": @"MON-QNAQN-VSSGK", @"type": @"月卡"}, @{@"code": @"MON-QUI76-4APZV", @"type": @"月卡"}, @{@"code": @"MON-R7IXW-US4F4", @"type": @"月卡"}, @{@"code": @"MON-S2ZAG-RFICB", @"type": @"月卡"}, @{@"code": @"MON-SB9WX-SUZ2G", @"type": @"月卡"}, @{@"code": @"MON-SJHAH-PH6H0", @"type": @"月卡"}, @{@"code": @"MON-SKFIG-39X3A", @"type": @"月卡"},
            @{@"code": @"MON-SS525-T3L2Z", @"type": @"月卡"}, @{@"code": @"MON-SY7UG-MKW2J", @"type": @"月卡"}, @{@"code": @"MON-T58AR-3IB3S", @"type": @"月卡"}, @{@"code": @"MON-TPKZ1-EFSU0", @"type": @"月卡"}, @{@"code": @"MON-U5BTF-VRVSR", @"type": @"月卡"}, @{@"code": @"MON-UJJJW-SRXC9", @"type": @"月卡"}, @{@"code": @"MON-UWF97-8C4JN", @"type": @"月卡"}, @{@"code": @"MON-V3425-2Y0DE", @"type": @"月卡"}, @{@"code": @"MON-V4RD6-S5E9L", @"type": @"月卡"}, @{@"code": @"MON-V52QX-7JRF5", @"type": @"月卡"},
            @{@"code": @"MON-VG9NI-CEZUO", @"type": @"月卡"}, @{@"code": @"MON-VNSX5-KWVUF", @"type": @"月卡"}, @{@"code": @"MON-VTKV2-EGK8S", @"type": @"月卡"}, @{@"code": @"MON-VX1EN-36E83", @"type": @"月卡"}, @{@"code": @"MON-WKL3D-ASCSZ", @"type": @"月卡"}, @{@"code": @"MON-WT1YK-52VG2", @"type": @"月卡"}, @{@"code": @"MON-WZDKX-GHRH9", @"type": @"月卡"}, @{@"code": @"MON-X0LEL-3QF59", @"type": @"月卡"}, @{@"code": @"MON-X10H0-S6DV5", @"type": @"月卡"}, @{@"code": @"MON-X3DLS-DPWJE", @"type": @"月卡"},
            @{@"code": @"MON-X8FF6-MHF1B", @"type": @"月卡"}, @{@"code": @"MON-XBW1I-9HHYE", @"type": @"月卡"}, @{@"code": @"MON-XCQ30-FIMNX", @"type": @"月卡"}, @{@"code": @"MON-YGQQM-DI9FV", @"type": @"月卡"}, @{@"code": @"MON-Z9AMX-DOKUI", @"type": @"月卡"}, @{@"code": @"MON-ZBDPC-8BPEG", @"type": @"月卡"}, @{@"code": @"MON-ZE3GY-E0HHU", @"type": @"月卡"}, @{@"code": @"MON-ZIZZS-SE0ZI", @"type": @"月卡"}, @{@"code": @"MON-ZQD5N-OWYSE", @"type": @"月卡"}, @{@"code": @"MON-ZZASM-608PT", @"type": @"月卡"},

            // ===== 星陨计划 永久卡 (100) =====
            @{@"code": @"PER-05WCF-7M2BU", @"type": @"永久卡"}, @{@"code": @"PER-0H2I9-IKCPN", @"type": @"永久卡"}, @{@"code": @"PER-0K41E-BPOY9", @"type": @"永久卡"}, @{@"code": @"PER-1MFL4-8OV97", @"type": @"永久卡"}, @{@"code": @"PER-1PIVM-POQD3", @"type": @"永久卡"}, @{@"code": @"PER-21H82-YD3T6", @"type": @"永久卡"}, @{@"code": @"PER-2B0NM-B0TRM", @"type": @"永久卡"}, @{@"code": @"PER-2TA5T-L1OUN", @"type": @"永久卡"}, @{@"code": @"PER-3ISDU-PNO14", @"type": @"永久卡"}, @{@"code": @"PER-3J6EJ-RAM1R", @"type": @"永久卡"},
            @{@"code": @"PER-3W563-4EB0L", @"type": @"永久卡"}, @{@"code": @"PER-41CNB-YAQKI", @"type": @"永久卡"}, @{@"code": @"PER-42EXA-9AWSC", @"type": @"永久卡"}, @{@"code": @"PER-455JP-M1KWJ", @"type": @"永久卡"}, @{@"code": @"PER-4L3VV-622BU", @"type": @"永久卡"}, @{@"code": @"PER-5DD72-PV8LM", @"type": @"永久卡"}, @{@"code": @"PER-5OJO8-UMG4U", @"type": @"永久卡"}, @{@"code": @"PER-5X2ZZ-ESDJY", @"type": @"永久卡"}, @{@"code": @"PER-64320-05C3F", @"type": @"永久卡"}, @{@"code": @"PER-6GPTX-1XPG1", @"type": @"永久卡"},
            @{@"code": @"PER-6U1RO-PPXMS", @"type": @"永久卡"}, @{@"code": @"PER-6VNW1-UIC32", @"type": @"永久卡"}, @{@"code": @"PER-6X0PH-BXLOE", @"type": @"永久卡"}, @{@"code": @"PER-6ZO11-ZEDOD", @"type": @"永久卡"}, @{@"code": @"PER-7CVKS-RPS1J", @"type": @"永久卡"}, @{@"code": @"PER-7DOXI-A3WTW", @"type": @"永久卡"}, @{@"code": @"PER-7ERSJ-WDIUG", @"type": @"永久卡"}, @{@"code": @"PER-86A8A-7YV12", @"type": @"永久卡"}, @{@"code": @"PER-879WG-AZT36", @"type": @"永久卡"}, @{@"code": @"PER-9PS8B-IU9JW", @"type": @"永久卡"},
            @{@"code": @"PER-9XP76-6GRWM", @"type": @"永久卡"}, @{@"code": @"PER-A4AG0-KJC7B", @"type": @"永久卡"}, @{@"code": @"PER-AARNF-FC8CJ", @"type": @"永久卡"}, @{@"code": @"PER-AFU1G-9O53A", @"type": @"永久卡"}, @{@"code": @"PER-AUCWB-2AITR", @"type": @"永久卡"}, @{@"code": @"PER-BL6EU-2QV3E", @"type": @"永久卡"}, @{@"code": @"PER-C1CP3-40Y3C", @"type": @"永久卡"}, @{@"code": @"PER-CFJ1H-PZ5IA", @"type": @"永久卡"}, @{@"code": @"PER-CP50R-E2NYW", @"type": @"永久卡"}, @{@"code": @"PER-DEAF7-BXRNL", @"type": @"永久卡"},
            @{@"code": @"PER-DLRVT-0RFAQ", @"type": @"永久卡"}, @{@"code": @"PER-DOJ9W-9TCJO", @"type": @"永久卡"}, @{@"code": @"PER-DS6XR-OMF0N", @"type": @"永久卡"}, @{@"code": @"PER-DSPHY-AME1R", @"type": @"永久卡"}, @{@"code": @"PER-EJVZU-J0UFR", @"type": @"永久卡"}, @{@"code": @"PER-FVW3R-NEFN4", @"type": @"永久卡"}, @{@"code": @"PER-FWC4U-F41CD", @"type": @"永久卡"}, @{@"code": @"PER-GPUY9-BPDYM", @"type": @"永久卡"}, @{@"code": @"PER-H567H-VIGP2", @"type": @"永久卡"}, @{@"code": @"PER-HBRCI-AYCKR", @"type": @"永久卡"},
            @{@"code": @"PER-HDZR4-KINUM", @"type": @"永久卡"}, @{@"code": @"PER-IBALF-MSESQ", @"type": @"永久卡"}, @{@"code": @"PER-ICWST-YP2BD", @"type": @"永久卡"}, @{@"code": @"PER-IJZU7-H8GN8", @"type": @"永久卡"}, @{@"code": @"PER-IN3ZO-BLWCU", @"type": @"永久卡"}, @{@"code": @"PER-J31PG-LXY38", @"type": @"永久卡"}, @{@"code": @"PER-JDR52-AYYJP", @"type": @"永久卡"}, @{@"code": @"PER-K7MZ8-WYJO7", @"type": @"永久卡"}, @{@"code": @"PER-LME7I-AXPD6", @"type": @"永久卡"}, @{@"code": @"PER-MAMME-33N65", @"type": @"永久卡"},
            @{@"code": @"PER-MFFND-GXMFX", @"type": @"永久卡"}, @{@"code": @"PER-MJSK0-R0XBR", @"type": @"永久卡"}, @{@"code": @"PER-MX9HI-JM1AO", @"type": @"永久卡"}, @{@"code": @"PER-MZLZH-M36FT", @"type": @"永久卡"}, @{@"code": @"PER-NI1X4-KBN79", @"type": @"永久卡"}, @{@"code": @"PER-O9LOS-3I1EG", @"type": @"永久卡"}, @{@"code": @"PER-OXFRJ-QFKC1", @"type": @"永久卡"}, @{@"code": @"PER-OYCI7-JTJEX", @"type": @"永久卡"}, @{@"code": @"PER-PEY64-EFKI4", @"type": @"永久卡"}, @{@"code": @"PER-PHTPP-IVW04", @"type": @"永久卡"},
            @{@"code": @"PER-PVMFP-BZZCE", @"type": @"永久卡"}, @{@"code": @"PER-QPEU3-O9O9J", @"type": @"永久卡"}, @{@"code": @"PER-R9DEC-ZZ3OR", @"type": @"永久卡"}, @{@"code": @"PER-RNAWM-RHL0J", @"type": @"永久卡"}, @{@"code": @"PER-RRT9W-T4J1T", @"type": @"永久卡"}, @{@"code": @"PER-S5DFE-QCCC0", @"type": @"永久卡"}, @{@"code": @"PER-S8ZAT-VQYAH", @"type": @"永久卡"}, @{@"code": @"PER-SO5G6-63VMV", @"type": @"永久卡"}, @{@"code": @"PER-STZNC-76H79", @"type": @"永久卡"}, @{@"code": @"PER-SZ3FN-KO59C", @"type": @"永久卡"},
            @{@"code": @"PER-SZO86-SHXHE", @"type": @"永久卡"}, @{@"code": @"PER-T76N7-149LW", @"type": @"永久卡"}, @{@"code": @"PER-TR7OB-HOPIF", @"type": @"永久卡"}, @{@"code": @"PER-TX8CR-CQLTN", @"type": @"永久卡"}, @{@"code": @"PER-TZ2VP-RJJ3Z", @"type": @"永久卡"}, @{@"code": @"PER-TZR5W-L16X8", @"type": @"永久卡"}, @{@"code": @"PER-UA2ME-4LLYW", @"type": @"永久卡"}, @{@"code": @"PER-UXSNR-TER2F", @"type": @"永久卡"}, @{@"code": @"PER-V1DQV-3IE40", @"type": @"永久卡"}, @{@"code": @"PER-VRWOB-9P6K9", @"type": @"永久卡"},
            @{@"code": @"PER-WJ95F-JMQNL", @"type": @"永久卡"}, @{@"code": @"PER-WKVQD-OCVW0", @"type": @"永久卡"}, @{@"code": @"PER-WSAAJ-R1LIV", @"type": @"永久卡"}, @{@"code": @"PER-XCU1D-BXMGL", @"type": @"永久卡"}, @{@"code": @"PER-XGCTB-7ZJXI", @"type": @"永久卡"}, @{@"code": @"PER-XXP3R-ZQQ1X", @"type": @"永久卡"}, @{@"code": @"PER-Y9GCP-90K9Y", @"type": @"永久卡"}, @{@"code": @"PER-YPV9N-0QMGQ", @"type": @"永久卡"}, @{@"code": @"PER-ZWFYN-WBW61", @"type": @"永久卡"}, @{@"code": @"PER-ZWMCH-IPXH8", @"type": @"永久卡"}
        ];
    });
    return database;
}

@interface AuthManager : NSObject
+ (instancetype)sharedInstance;
- (void)checkAndLoad;
@end

@implementation AuthManager
+ (instancetype)sharedInstance {
    static AuthManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ instance = [[AuthManager alloc] init]; });
    return instance;
}
- (void)checkAndLoad {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *activeCode = [defaults objectForKey:kKeyActiveCode];
    NSString *activeDevice = [defaults objectForKey:kKeyActiveDevice];
    NSTimeInterval activationTime = [defaults doubleForKey:kKeyActivationTime];
    NSString *codeType = [defaults objectForKey:kKeyCodeType];
    
    NSString *currentDevice = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    BOOL isValid = NO;
    
    if (activeCode && [activeDevice isEqualToString:currentDevice]) {
        NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
        NSTimeInterval elapsed = now - activationTime;
        if ([codeType isEqualToString:@"永久卡"]) isValid = YES;
        else if ([codeType isEqualToString:@"日卡"]) isValid = (elapsed < 24 * 3600);
        else if ([codeType isEqualToString:@"月卡"]) isValid = (elapsed < 30 * 24 * 3600);
    }
    
    if (isValid) {
        [self loadTargetDylib];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{ [self showAuthUI]; });
    }
}

- (void)loadTargetDylib {
    // 针对星陨计划：加载 libArkRecode.dylib
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString *dylibPath = [bundlePath stringByAppendingPathComponent:@"Frameworks/libArkRecode.dylib"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dylibPath]) { 
        NSLog(@"[Auth] 找不到目标: %@", dylibPath);
        return; 
    }
    dlopen([dylibPath UTF8String], RTLD_NOW);
}

- (void)showAuthUI {
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    if (!rootVC) return;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"授权验证" message:@"请输入您的激活码以启动游戏" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) { textField.placeholder = @"粘贴或输入激活码"; }];
    
    UIAlertAction *activateAction = [UIAlertAction actionWithTitle:@"激活" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { 
        [self verifyCode:alert.textFields.firstObject.text]; 
    }];
    
    UIAlertAction *exitAction = [UIAlertAction actionWithTitle:@"退出游戏" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) { 
        exit(0); 
    }];
    
    [alert addAction:activateAction];
    [alert addAction:exitAction];
    [rootVC presentViewController:alert animated:YES completion:nil];
}

- (void)verifyCode:(NSString *)code {
    NSArray *codesArray = getAuthDatabase();
    BOOL codeFound = NO;
    NSString *cardType = nil;
    NSString *cleanCode = [[code stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    for (NSDictionary *dict in codesArray) {
        if ([dict[@"code"] isEqualToString:cleanCode]) { codeFound = YES; cardType = dict[@"type"]; break; }
    }
    
    if (!codeFound) { 
        [self showErrorAndKill:@"激活码无效，请检查输入"]; 
        return; 
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *savedDevice = [defaults objectForKey:[NSString stringWithFormat:@"Device_%@", cleanCode]];
    NSString *currentDevice = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    if (savedDevice && ![savedDevice isEqualToString:currentDevice]) { 
        [self showErrorAndKill:@"该激活码已在其他设备绑定，无法跨设备使用"]; 
        return; 
    }
    
    [defaults setObject:cleanCode forKey:kKeyActiveCode];
    [defaults setObject:currentDevice forKey:kKeyActiveDevice];
    [defaults setObject:@([[NSDate date] timeIntervalSince1970]) forKey:kKeyActivationTime];
    [defaults setObject:cardType forKey:kKeyCodeType];
    [defaults setObject:currentDevice forKey:[NSString stringWithFormat:@"Device_%@", cleanCode]];
    [defaults synchronize];
    
    [self loadTargetDylib];
    
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    [rootVC dismissViewControllerAnimated:YES completion:^{ 
        UIAlertController *successAlert = [UIAlertController alertControllerWithTitle:@"成功" message:@"授权成功，祝您游戏愉快！" preferredStyle:UIAlertControllerStyleAlert];
        [successAlert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [rootVC presentViewController:successAlert animated:YES completion:nil];
    }];
}

- (void)showErrorAndKill:(NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
        [rootVC dismissViewControllerAnimated:YES completion:nil]; 
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"错误" message:message preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) { 
            exit(0); 
        }]];
        [rootVC presentViewController:alert animated:YES completion:nil];
    });
}

@end

__attribute__((constructor)) static void initPlugin() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[AuthManager sharedInstance] checkAndLoad];
    });
}
