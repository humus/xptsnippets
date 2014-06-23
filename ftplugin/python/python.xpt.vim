XPTemplate priority=personal
XPTinclude
      \ _common/common

XPT dict " `dict^ = {...'entry': 'value'...}
XSET val|pre=
`dict^ = {`'`entry`'^: `value^`...^ \
, `'`key`'^: `val^`...^}
..XPT


XPT field
XSET type=Choose(['CharField', 'TextField', 'DateField'])
XSET tf1=Choose(['True', 'False'])
XSET tf2=Choose(['True', 'False'])
XSET tf1|pre=False
XSET tf2|pre=False
XSET name|pre=var
XSET name|def=S(R('var'), '^.', '\u&', '')
`var^ = models.`type^('`name^', `max_length...{{^max_length=,`50^, `}}^help_text='`help_text^', `null...{{^null=`tf1^, blank=`tf2^)`}}^


XPT Meta
class Meta:
    `ordering...{{^ordering = ('`var^',)
    `}}^`verbose_name...{{^verbose_name='`verbose_name^'
    `}}^`verbose_name_plural...{{^verbose_name_plural='`name_plural^'
    `}}^`db_table...{{^db_table='`var^'`}}^

XPT meta alias=Meta

XPT admininline
XSET StackedTabular=Choose(['StackedInline', 'TabularInline'])
XSET extra|def=0
class `model^Inline(admin.`StackedTabular^):
    model=`model^
    extra=`extra^

class `container_model^Admin(admin.ModelAdmin):
    model=`container_model^
    inlines=[`model^Inline]

XPT adminline alias=admininline
