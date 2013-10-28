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

XPT log4j
<log4j:configuration xmlns:log4j="http://jakarta.apache.org/log4j/" debug="true">
    `cursor^
</log4j:configuration>

XPT rfa " RollingFileAppender
<appender name="`appender^" class="org.apache.log4j.RollingFileAppender">
    <param name="File" value="`file^"/>
    <param name="MaxFileSize" value="`size^MB"/>
    <param name="MaxBackupIndex" value="`max_index^"/>
    <layout class="org.apache.log4j.PatternLayout">
        <param name="ConversionPattern" value="`%p [%d{dd-MM-yy HH:mm:ss}] (%c{3}) %m%n^"/>
    </layout>
</appender>

XPT console " ConsoleAppender
<appender name="`console^" class="org.apache.log4j.ConsoleAppender">
    <layout class="org.apache.log4j.PatternLayout">
        <param name="ConversionPattern" value="[%p] [%d{dd-MM-yy HH:mm:ss}] %c{1}: %m%n"/>
    </layout>
</appender>

XPT logger " <logger name="name" additivity="true">..</logger>
<logger name="`logger^" additivity="`true^">
    <level value="`debug^"/>
    <appender-ref ref="`ref^"/>
</logger>

XPT root " <root>...</root>
<root>
    <level value="`info^"/>
    <appender-ref ref="`ref^"/>
</root>

XPT rootlogger "root
XSET level=Choose(['error', 'warn', 'info', 'debug', 'trace'])
<root>
    <level value="`level^" />
    <appender-ref ref="`ref^" />
</root>

XPT jrebel "xmlns="http://www.zeroturnaround.com"
<?xml version="1.0" encoding="UTF-8"?>
<application xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.zeroturnaround.com"
            xsi:schemaLocation="http://www.zeroturnaround.com http://www.zeroturnaround.com/alderaan/rebel-2_0.xsd">
    <classpath>
        `cursor^
    </classpath>
</application>

XPT jrd " dir name="dirname"
<dir name="`cursor^"/>

XPT head " <?xml version=1.0?>
<?xml version="1.0" encoding="utf-8" ?>
`cursor^

