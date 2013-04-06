XPTemplate priority=personal

XPT tag " <tag></tag>
<`tag^>`cursor^</`tag^>

XPT ta "<tag attrs="values">`cursor^</tag>"
<`tag^ `:attr:^>`cursor^</`tag^>

XPT t alias=tag

XPT T " <tag>`cursor^</tag>
<`tag^>
    `cursor^
</`tag^>
..XPT

XPT Ta "<tag attrs="values">`cursor^</tag>
<`tag^` 	...attrs{{^ `:attr:^`}}^>
    `cursor^
</`tag^>

XPT tt alias=Ta

XPT attr
`at^="`val^"`att...{{^` `attribute^="`value^"`att...^`}}^
..XPT

XPT androidC " <AndroidComponent a:orientation="" a.layout_width=""...
XSET prefix|pre=android
XSET height|pre=wrap_content
XSET width|pre=wrap_content
XSET string|pre=
<`control^ `prefix^:layout_height="`height^"
        `prefix^:layout_width="`width^"
        `prefix^:text="@string/`string^"`cursor^/>
..XPT

XPT droidattsd
XSET prefix|pre=android
XSET width|pre=fill_parent
XSET height|pre=fill_parent
`prefix^:layout_width="`width^"
`prefix^:layout_height="`height^"

XPT droidat
XSET prefix|pre=android
    `prefix^:`att^="`value^"`...^
    `prefix^:`att^="`value^"`...^
..XPT

XPT short
<`tag^`att...{{^` `attribute^="`value^"`att...^`}}^/>

XPT log4j " log4j
<!DOCTYPE log4j:configuration PUBLIC "-//APACHE//DTD LOG4J 1.2//EN" "log4j.dtd">
<log4j:configuration xmlns:log4j='http://jakarta.apache.org/log4j/' debug="true">
`cursor^
</log4j:configuration>
..XPT

XPT consoleappender "appender name=console class=org...log4j.ConsoleAppender
<appender name="`console^" class="org.apache.log4j.ConsoleAppender">
    <layout class="org.apache.log4j.PatternLayout">
        <param name="ConversionPattern" value="`%d %-5p [%t] %c - %m%n^"/>
    </layout>
</appender>

..XPT

XPT rollingappender "appender name=appender class=org...log4j.RollingFileAppender
<appender name="`fileappender^" class="org.apache.log4j.RollingFileAppender">
    <param name="File" value="`file.log^"/>
    <param name="MaxFileSize" value="`5MB^"/>
    <param name="append" value="`true^"/>
    <param name="MaxBackupIndex" value="5"/>
    <layout class="org.apache.log4j.PatternLayout">
        <param name="ConversionPattern" value="`%d %-5p [%t] %c - %m%n^"/>
    </layout>
</appender>

..XPT

XPT logger " logger name=domain.package
XSET additivity=Choose(['true', 'false'])
XSET level=Choose(['error', 'warn', 'info', 'debug', 'trace'])
<logger name="`package^" additivity="`additivity^">
    <level value="`level^"/>
    <appender-ref ref="`ref^"/>
</logger>

..XPT

XPT rootlogger "root
XSET level=Choose(['error', 'warn', 'info', 'debug', 'trace'])
<root>
    <level value="`level^" />
    <appender-ref ref="`ref^" />
</root>
