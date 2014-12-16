<?php /* #?ini charset="utf8"?

# Setting file for ezflow zones as used by the Layout datatype
# A layout is divided into zones and then blocks, take a look in
# block.ini for block definitions.

[General]
AllowedTypes[]
#AllowedTypes[]=GlobalZoneLayout
#AllowedTypes[]=2ZonesLayout1
#AllowedTypes[]=2ZonesLayout2
#AllowedTypes[]=2ZonesLayout3
#AllowedTypes[]=3ZonesLayout2
#AllowedTypes[]=CallForActionLayout
AllowedTypes[]=SingleZoneLayout
AllowedTypes[]=UtdanningBoksLayout
AllowedTypes[]=InnholdssideBoksLayout
AllowedTypes[]=FrontpageLayout
AllowedTypes[]=3ZonesLayoutLRT

#[GlobalZoneLayout]
#ZoneTypeName=Global zone layout
#Zones[]=main
#ZoneName[main]=Global zone
#ZoneThumbnail=globalzone_layout.gif
#Template=globalzonelayout.tpl
#AvailableForClasses[]=global_layout
#AvailableForClasses[]=hials_portal_page
#AvailableForClasses[]=hials_avdeling

#[2ZonesLayout1]
#ZoneTypeName=2 zones (layout 1)
#Zones[]=left
#Zones[]=right
#ZoneName[left]=Left zone
#ZoneName[right]=Right zone
#ZoneThumbnail=2zones_layout1.gif
#Template=2zoneslayout1.tpl
#AvailableForClasses[]=frontpage
#AvailableForClasses[]=landing_page

#[2ZonesLayout2]
#ZoneTypeName=2 zones (layout 2)
#Zones[]=left
#Zones[]=right
#ZoneName[left]=Left zone
#ZoneName[right]=Right zone
#ZoneThumbnail=2zones_layout2.gif
#Template=2zoneslayout2.tpl
#AvailableForClasses[]=frontpage
#AvailableForClasses[]=landing_page

#[2ZonesLayout3]
#ZoneTypeName=2 zones (layout 3)
#Zones[]=top
#Zones[]=bottom
#ZoneName[top]=Top zone
#ZoneName[bottom]=Bottom zone
#ZoneThumbnail=2zones_layout3.gif
#Template=2zoneslayout3.tpl
#AvailableForClasses[]=frontpage
#AvailableForClasses[]=landing_page

#[3ZonesLayout2]
#ZoneTypeName=3 zones (layout 2)
#Zones[]=left
#Zones[]=right
#Zones[]=bottom
#ZoneName[left]=Left zone
#ZoneName[right]=Right zone
#ZoneName[bottom]=Bottom zone
#ZoneThumbnail=3zones_layout2.gif
#Template=3zoneslayout2.tpl
#AvailableForClasses[]=frontpage
#AvailableForClasses[]=landing_page

#[CallForActionLayout]
#ZoneTypeName=Call For Action zone layout
#Zones[]=main
#ZoneName[main]=Call For Action zone
#ZoneThumbnail=callforaction_layout.gif
#Template=callforactionlayout.tpl
#AvailableForClasses[]=folder

[UtdanningBoksLayout]
ZoneTypeName=Utdanningsboks zone layout
Zones[]=main
ZoneName[main]=Utdanningsboks zone
ZoneThumbnail=utdanningsboks_layout.gif
Template=utdanningsbokslayout.tpl
AvailableForClasses[]=hials_utdanningstilbud

#[InnholdssideBoksLayout]
#ZoneTypeName=Innholsside zone layout
#Zones[]=left
#Zones[]=top
#ZoneName[left]=Left
#ZoneName[top]=Top
#ZoneThumbnail=hials_contentpage_layout.gif
#Template=hials_innholdssidelayout.tpl
#AvailableForClasses[]=hials_contentpage

[SingleZoneLayout]
ZoneTypeName=Single zone layout
Zones[]=main
ZoneName[main]=Main zone
ZoneThumbnail=singlezone_layout.gif
Template=singlezone_layout.tpl
AvailableForClasses[]=hials_portal_page
AvailableForClasses[]=hials_avdeling
AvailableForClasses[]=hials_contentpage
AvailableForClasses[]=hials_forskningsprosjekt
AvailableForClasses[]=hials_frontpage

[FrontpageLayout]
ZoneTypeName=Frontpage zone layout
Zones[]=carousel
Zones[]=top_side
Zones[]=box
Zones[]=news
Zones[]=misc
ZoneName[carousel]=Carousel Zone
ZoneName[top_side]=Top toolbox Zone
ZoneName[box]=Box Zone
ZoneName[news]=News Zone
ZoneName[misc]=Misc Zone
Template=frontpagezone_layout.tpl
ZoneThumbnail=frontpagezone_layout.gif
AvailableForClasses[]=hials_frontpage

[3ZonesLayoutLRT]
ZoneTypeName=3 zones (Left/Right/Top)
Zones[]
Zones[]=left
Zones[]=right
Zones[]=top
ZoneName[]
ZoneName[left]=Left zone
ZoneName[right]=Right zone
ZoneName[bottom]=Top zone
ZoneThumbnail=3zones_layoutLRT.gif
Template=3zoneslayoutLRT.tpl
AvailableForClasses[]=hials_portal_page

*/ ?>