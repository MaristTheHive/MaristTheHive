#!/bin/bash

BLACK='\e[0;30m'     
RED='\e[0;31m'
GREEN='\e[0;32m'
YELLOW='\e[0;33m' 
BLUE='\e[0;34m' 
PURPLE='\e[0;35m' 
CYAN='\e[0;36m' 
WHITE='\e[0;37m'
RESET='\e[0m' 

 echo -e
 "
.hhhhhhhhhhhhhh+:/yhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhs/:shhhhhhhhhhhhhh    
-MMMMMMMMMMMMMMysNyshMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNyshN+dMMMMMMMMMMMMMM    
-MMMMMMMMMMMMMN/dMMNdsyNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNysmMMMh+MMMMMMMMMMMMMM    
-MMMMMMMMMMMMM+dMMNmMMdoyMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNyomMNmNMMhoMMMMMMMMMMMMM    
-MMMMMMMMMMMMsyMNNMmhmMMdohMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMyomMMdyNMNMMsyMMMMMMMMMMMM    
-MMMMMMMMMMMm/MMsNMMdyhmMNhomMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMdohMMmyymMMdhMM/NMMMMMMMMMMM    
-MMMMMMMMMMM+dMN-NMMMyyyhNMNssNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNsyNMNhsyhMMMd:MMysMMMMMMMMMMM    
-MMMMMMMMMMM:MMy-mMMMdyyyydMMdohNNMMMMMMMMMMMMMMMMMMMMMMMMMMNNhomMNdyo+ymMMMh.dMM:MMMMMMMMMMM    
-MMMMMMMMMMM:MM+-yMMMmyyyyyhmMNyyyyyyyhhhddmdddddddddhhhyyyyyyhMMmys++oyNMMMs.sMM/MMMMMMMMMMM    
-MMMMMMMMMMM:MM+-/MMMmyyyyyydMMMNNNNNNNmmmdmmddddmmdmmmNNNNNNNMMMdys++syNMMN:.sMM/MMMMMMMMMMM    
-MMMMMMMMMMM:MMs\`:yMMNyyyydNMNdhyyyyyhhhhhhddddddddhhhhhhyyyyyhdNMNhysyyNMMo:\`hMN/MMMMMMMMMMM    
-MMMMMMMMMMMysMN..:yMMNdhmMM${RED}dyyssyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyym]${RESET}MMmhdNMMs:.-MMohMMMMMMMMMMM    
-MMMMMMMMMMMM/mMd-\`.oNMMMMN${RED}hysosyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyh]${RESET}NMMMMm+.\`:mMhoMMMMMMMMMMMM    
-MMMMMMMMMMMMN+mMN/  -mMMN${RED}yys+oyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyh]${RESET}NMMd.  +NMd+MMMMMMMMMMMMM    
-MMMMMMMMMMMMMhsMMs  .NMN${RED}yys+oyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy]${RESET}NMd\`  yMM+mMMMMMMMMMMMMM    
-MMMMMMMMMMMNh+NMm. .dMN${RED}yys+oyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy]${RESET}NMh\` -NMm+dNMMMMMMMMMMM    
-MMMMNNNNdysydMNy. -mMN${RED}yys++syyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy]${RESET}NMd. .hMMhyyydNNNNMMMM    
-MMoyyhhhdNMNms-  .mMN${RED}yys++++syyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyh]${RESET}NMd\`  :ymNMNdhhyhssMM    
-MMsyMMMhyo/.     dMN${RED}yys++++++ssyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyh]${RESET}MMy  \` \`-/oydMMModMM    
-MMM+hMMy-       :MM${RED}hyy++++ossssyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyd]${RESET}MM.  \`-\`  :hMMysMMM    
-MMMMyoMMs       \`mMN${RED}yyso+++++osssyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyh]${RESET}NMh    --  hMM/hMMMM    
-MMMm+dMN.        \`yMM${RED}mhyyso+++++++ossyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyhm]${RESET}MMs\`   \`.:\` -MMhoNMMM    
-mysyMMN:           -yNMN${RED}dhyyssoo+++++osyyyyyyyyyyyyyyyyyyyyyyyyyyyhm]${RESET}NMNs.    .::--\` /NMNsshm    
./yMMMd.              \`/yNMMN${RED}dhyyyysoo+++syyyyyyyyyyyyyyyyyyyyhdm]${RESET}NMMNy/\`      -:-     -mMMMo+    
-MdoyNMMmm.           \`:+ymMMMMMMN${RED}mhyyso++oyyyyyyyyyyyyyyydm]${RESET}NMMMMMMms+-\`      -:-  -mNMMmsomM    
-MMMmysyMM/          :NNhyyyhhmd-dMMN${RED}dyyo++oyyyyyyyyyyyyd]${RESET}MMM:odmhhyyydNm.     -:-  oMMosyNMMM    
-MMMMMhsMM:           -ymysyhhNNNMhdMM${RED}myyo++ssyyyyyyyyym]${RESET}MNNMNNymhhyshms.      -:-  +MM+dMMMMM    
-MMMNyoMMh              .odmddddhhhdmMM${RED}hys++osyyyyyyyyh]${RESET}MMmddhhddddmho.    \`\`\`.-:-  \`dMNoyNMMM    
-MooymMMm+-.        \`     \`./syhdddddMM${RED}dyy++syyyyyyyyym]${RESET}MMdddddhyo/.\`   \`.---..\`\` \`.-+NMMmy+sM    
-MmysyhdNMNNmd:  \`--\`  \`       \`\`\`\`\`.MM${RED}dyy++yyyyyyyyyym${RESET}MN\`\`\`\`\`\`       \`  \`--.  /dmNNMNdhyshNM    
-MMMMNmdy:NMN:  --:--.\`\`:+o/-        NMmyy++yyyyyyyyyyNMd       \`-+o+:\`\`.--:--  /NMm:hdmNMMMM    
-MMMMMMMohMM+\`\`\`\`\`\`\`\`\`..\`\`./ydo-     hMMyyo+yyyyyyyyyyMMs     -sdy/. \`..\`\`\`\`\`\`\`\`\`oMMsyMMMMMMM    
-MMMMMMN/MMMmmmmmmmddhys+:-.\`-smy.   +MMhys+syyyyyyyydMM:   -hms.\`.-/+syhddmmmmmmNMMM:MMMMMMM    
\`:::::\::+yyyyyyyyyyhhhddmNNmdo:/Nm:  \`NMmyy+oyyyyyyyyNMm   +Nm::sdmNNmddhhhyyyy+ooosy/:::::::    
      -NNMMMMMMMMNNNmmmdysydNMmmMN:  sMMyysoyyyyyyyyMM+  +MMdmMmhyyhdhsyyhhhhy\`--.yhy.          
      -MMMMMMMMMMMMMMMMMMMNdysdMMMN\` \`mMdys+syyyyyymMh  -NMMMdsydNMMMs                          
      -MMMMMMMMMMMMMMMMMMMMMMmysNMMo  /MMhyssyyyyydMM-  yMMmoyNMMMMMMs                          
      -MMMMMMMMMMMMMMMMMMMMMMMMd+mMN\`  dMNhyyyyyyhMMh  .MMd+mMMMMMMMMs                          
      -MMMMMMMMMMMMMMMMMMMMMMMMMN/NMs  +MMNNmmmmNMMM:  hMm/NMMMMMMMMMs                          
      -MMMMMMMMMMMMMMMMMMMMMMMMMMdoMM/\`.MNoshhddmNMN \`oMM/mMMMMMMMMMMs                          
      -MMMMMMMMMMMMMMMMMMMMMMMMMMM/mMMhsMM+shdmNNNMNsdMMd+MMMMMMMMMMMs                          
      -MMMMMMMMMMMMMMMMMMMMMMMMMMMm/mMMMMMhsydMmddMMMMMd+NMMMMMMMMMMMs                          
      -MMMMMMMMMMMMMMMMMMMMMMMMMMMMNoyNMMMMNMMNmdNMMMNssNMMMMMMMMMMMMs                          
      -MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMmsshNNNNNmNNNNhsymMMMMMMMMMMMMMMs                          
      .yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyo/::::::::/oyyyyyyyyyyyyyyyyy/ 
"

exit 0
