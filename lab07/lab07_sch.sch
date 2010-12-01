<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Dec_in(2:0)" />
        <signal name="Dec_out(7:0)" />
        <signal name="Dec_in(0)" />
        <signal name="Dec_in(1)" />
        <signal name="Dec_in(2)" />
        <signal name="Dec_out(0)" />
        <signal name="Dec_out(1)" />
        <signal name="Dec_out(2)" />
        <signal name="Dec_out(3)" />
        <signal name="Dec_out(4)" />
        <signal name="Dec_out(5)" />
        <signal name="Dec_out(6)" />
        <signal name="Dec_out(7)" />
        <signal name="en" />
        <port polarity="Input" name="Dec_in(2:0)" />
        <port polarity="Output" name="Dec_out(7:0)" />
        <port polarity="Input" name="en" />
        <blockdef name="d3_8e">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-576" y2="-576" x1="0" />
            <line x2="64" y1="-512" y2="-512" x1="0" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="320" y1="-576" y2="-576" x1="384" />
            <line x2="320" y1="-512" y2="-512" x1="384" />
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <rect width="256" x="64" y="-640" height="576" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
        </blockdef>
        <block symbolname="d3_8e" name="XLXI_1">
            <blockpin signalname="Dec_in(0)" name="A0" />
            <blockpin signalname="Dec_in(1)" name="A1" />
            <blockpin signalname="Dec_in(2)" name="A2" />
            <blockpin signalname="en" name="E" />
            <blockpin signalname="Dec_out(0)" name="D0" />
            <blockpin signalname="Dec_out(1)" name="D1" />
            <blockpin signalname="Dec_out(2)" name="D2" />
            <blockpin signalname="Dec_out(3)" name="D3" />
            <blockpin signalname="Dec_out(4)" name="D4" />
            <blockpin signalname="Dec_out(5)" name="D5" />
            <blockpin signalname="Dec_out(6)" name="D6" />
            <blockpin signalname="Dec_out(7)" name="D7" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1200" y="1168" name="XLXI_1" orien="R0" />
        <branch name="Dec_in(2:0)">
            <wire x2="992" y1="560" y2="560" x1="736" />
            <wire x2="992" y1="560" y2="592" x1="992" />
            <wire x2="992" y1="592" y2="608" x1="992" />
            <wire x2="992" y1="608" y2="656" x1="992" />
            <wire x2="992" y1="656" y2="704" x1="992" />
            <wire x2="992" y1="704" y2="720" x1="992" />
            <wire x2="992" y1="720" y2="768" x1="992" />
        </branch>
        <iomarker fontsize="28" x="736" y="560" name="Dec_in(2:0)" orien="R180" />
        <bustap x2="1088" y1="592" y2="592" x1="992" />
        <bustap x2="1088" y1="656" y2="656" x1="992" />
        <bustap x2="1088" y1="720" y2="720" x1="992" />
        <branch name="Dec_in(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1120" y="592" type="branch" />
            <wire x2="1120" y1="592" y2="592" x1="1088" />
            <wire x2="1200" y1="592" y2="592" x1="1120" />
        </branch>
        <branch name="Dec_in(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1120" y="656" type="branch" />
            <wire x2="1120" y1="656" y2="656" x1="1088" />
            <wire x2="1200" y1="656" y2="656" x1="1120" />
        </branch>
        <branch name="Dec_in(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1120" y="720" type="branch" />
            <wire x2="1120" y1="720" y2="720" x1="1088" />
            <wire x2="1200" y1="720" y2="720" x1="1120" />
        </branch>
        <iomarker fontsize="28" x="1936" y="544" name="Dec_out(7:0)" orien="R0" />
        <branch name="Dec_out(7:0)">
            <wire x2="1936" y1="544" y2="544" x1="1792" />
            <wire x2="1792" y1="544" y2="592" x1="1792" />
            <wire x2="1792" y1="592" y2="656" x1="1792" />
            <wire x2="1792" y1="656" y2="720" x1="1792" />
            <wire x2="1792" y1="720" y2="784" x1="1792" />
            <wire x2="1792" y1="784" y2="848" x1="1792" />
            <wire x2="1792" y1="848" y2="912" x1="1792" />
            <wire x2="1792" y1="912" y2="976" x1="1792" />
            <wire x2="1792" y1="976" y2="1040" x1="1792" />
            <wire x2="1792" y1="1040" y2="1088" x1="1792" />
        </branch>
        <bustap x2="1696" y1="592" y2="592" x1="1792" />
        <bustap x2="1696" y1="656" y2="656" x1="1792" />
        <bustap x2="1696" y1="720" y2="720" x1="1792" />
        <bustap x2="1696" y1="784" y2="784" x1="1792" />
        <bustap x2="1696" y1="848" y2="848" x1="1792" />
        <bustap x2="1696" y1="912" y2="912" x1="1792" />
        <bustap x2="1696" y1="976" y2="976" x1="1792" />
        <bustap x2="1696" y1="1040" y2="1040" x1="1792" />
        <branch name="Dec_out(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1616" y="592" type="branch" />
            <wire x2="1616" y1="592" y2="592" x1="1584" />
            <wire x2="1696" y1="592" y2="592" x1="1616" />
        </branch>
        <branch name="Dec_out(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1616" y="656" type="branch" />
            <wire x2="1616" y1="656" y2="656" x1="1584" />
            <wire x2="1696" y1="656" y2="656" x1="1616" />
        </branch>
        <branch name="Dec_out(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1616" y="720" type="branch" />
            <wire x2="1600" y1="720" y2="720" x1="1584" />
            <wire x2="1616" y1="720" y2="720" x1="1600" />
            <wire x2="1696" y1="720" y2="720" x1="1616" />
        </branch>
        <branch name="Dec_out(3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1616" y="784" type="branch" />
            <wire x2="1616" y1="784" y2="784" x1="1584" />
            <wire x2="1696" y1="784" y2="784" x1="1616" />
        </branch>
        <branch name="Dec_out(4)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1616" y="848" type="branch" />
            <wire x2="1616" y1="848" y2="848" x1="1584" />
            <wire x2="1696" y1="848" y2="848" x1="1616" />
        </branch>
        <branch name="Dec_out(5)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1616" y="912" type="branch" />
            <wire x2="1616" y1="912" y2="912" x1="1584" />
            <wire x2="1696" y1="912" y2="912" x1="1616" />
        </branch>
        <branch name="Dec_out(6)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1616" y="976" type="branch" />
            <wire x2="1616" y1="976" y2="976" x1="1584" />
            <wire x2="1696" y1="976" y2="976" x1="1616" />
        </branch>
        <branch name="Dec_out(7)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1616" y="1040" type="branch" />
            <wire x2="1616" y1="1040" y2="1040" x1="1584" />
            <wire x2="1696" y1="1040" y2="1040" x1="1616" />
        </branch>
        <branch name="en">
            <wire x2="1200" y1="1040" y2="1040" x1="1168" />
        </branch>
        <iomarker fontsize="28" x="1168" y="1040" name="en" orien="R180" />
    </sheet>
</drawing>