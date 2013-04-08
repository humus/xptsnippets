XPTemplate priority=personal

let s:f = g:XPTfuncs()

" use snippet 'varConst' to generate contant variables
" use snippet 'varFormat' to generate formatting variables
" use snippet 'varSpaces' to generate spacing variables


XPTinclude
      \ _common/common
      \ xml/xml

XPT schema " schema /schema
<schema xmlns="http://www.w3.org/2001/XMLSchema"
    targetNamespace="`targetnamespace^"
    xmlns:`tns^="`targetnamespace^"
    elementFormDefault="qualified">
    `cursor^
</schema>

XPT element " element /element
<element name="`elment_name^">
    `cursor^
</element>

XPT complext " complexType /complexType
<complexType>
    `cursor^
</complexType>

XPT complexName " complextype[name=NAME]
<complexType name="`name^">
    `cursor^
</complexType>

XPT sequence " sequence /sequence
<sequence>
    `cursor^
</sequence>

XPT element " element/
XSET type=Choose(['string', 'int', 'boolean', 'date', 'decimal', 'long'])
XSET max=Choose(['1', 'unbounded'])
<element name="`name^" type="`type^"`minmax...{{^ minOccurs="`0^"` maxOccurs="`max`"^`}}^/>

XPT elems
`:element:^`element...{{^
`:element:^`element...^`}}^

XPT elemType " element name=... type=tns:
<element name="`name^" type="``tns`:^`type^"/>

XPT elemtype alias=elemType

XPT restriction
XSET type=Choose(['string', 'integer', 'boolean', 'decimal'])
<restriction base="`type^">
    `cursor^
</restriction>

XPT pattern " pattern value='...'
<pattern value="`val^"/>

XPT enum "<enumeration.../>
<enumeration value="`val^"/>`enumeration...{{^
<enumeration value="`val^"/>`enumeration...^`}}^

XPT whitespace " whiteSpace value=preserve\|replace\|collapse
XSET whitespace=Choose(['preserve', 'replace', 'collapse'])
<whiteSpace value="`whitespace^"/>

XPT constraint " inline restriction
XSET constraint=Choose(['enumeration', 'fractionDigits', 'length', 'maxExclusive', 'maxInclusive', 'maxLength', 'minExclusive', 'minInclusive', 'minLength', 'pattern', 'totalDigits', 'whiteSpace'])
<`constraint^ value="`val^">

XPT extension " <extension base="parent".../>
<extension base="`parent^">
    `cursor^
</extension>


