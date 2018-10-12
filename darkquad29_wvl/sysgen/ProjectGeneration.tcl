#
# Created by System Generator     Sat Apr 21 16:13:15 2018
#
# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator.
#

namespace eval ::xilinx::dsptool::iseproject::param {
    set SynthStrategyName {XST Defaults*}
    set ImplStrategyName {ISE Defaults*}
    set Compilation {NGC Netlist}
    set Project {darkquad29_wvl_cw}
    set DSPFamily {Virtex6}
    set DSPDevice {xc6vsx475t}
    set DSPPackage {ff1759}
    set DSPSpeed {-1}
    set HDLLanguage {vhdl}
    set SynthesisTool {XST}
    set Simulator {Modelsim-SE}
    set ReadCores {False}
    set MapEffortLevel {High}
    set ParEffortLevel {High}
    set Frequency {250}
    set CreateInterfaceDocument {off}
    set NewXSTParser {1}
	if { [ string equal $Compilation {IP Packager} ] == 1 } {
		set PostProjectCreationProc {dsp_package_for_vivado_ip_integrator}
		set IP_Library_Text {SysGen}
		set IP_Vendor_Text {Xilinx}
		set IP_Version_Text {1.0}
		set IP_Categories_Text {System Generator for DSP}
		set IP_Common_Repos {0}
		set IP_Dir {}
		set IP_LifeCycle_Menu {1}
		set IP_Description    {}
		
	}
    set ProjectFiles {
        {{darkquad29_wvl_cw.vhd} -view All}
        {{darkquad29_wvl.vhd} -view All}
        {{darkquad29_wvl_cw.ucf}}
        {{darkquad29_wvl_cw.xdc}}
        {{bmg_72_5886869123e35b2f.mif}}
        {{bmg_72_a5223615887f70b9.mif}}
        {{bmg_72_b851979848828b10.mif}}
        {{bmg_72_ccc293fe4d2b0f7a.mif}}
        {{bmg_72_3b6e667e30cd6119.mif}}
        {{bmg_72_386cbab83765f0cd.mif}}
        {{bmg_72_4ed81b7c7b802023.mif}}
        {{bmg_72_79627314d23ed512.mif}}
        {{bmg_72_ee57e7186689376a.mif}}
        {{bmg_72_83f6efe890a72ff6.mif}}
        {{bmg_72_88f9a9ffe68f6b35.mif}}
        {{bmg_72_5200d17ea41d7d8d.mif}}
        {{bmg_72_6496c8c9773931f5.mif}}
        {{bmg_72_b40f882ae90aebcf.mif}}
        {{bmg_72_c89b8e32d1739de7.mif}}
        {{bmg_72_0164249481f978ca.mif}}
        {{/Scratch/firmware/chan1024/darkquad29_wvl.slx}}
    }
    set TopLevelModule {darkquad29_wvl_cw}
    set SynthesisConstraintsFile {darkquad29_wvl_cw.xcf}
    set ImplementationStopView {Structural}
    set ProjectGenerator {SysgenDSP}
}
    source SgIseProject.tcl
    ::xilinx::dsptool::iseproject::create
