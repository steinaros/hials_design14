<?php /*

[General]
AllowedTypes[]
#AllowedTypes[]=Campaign
#AllowedTypes[]=MainStory
AllowedTypes[]=ContentGrid
#AllowedTypes[]=Gallery
AllowedTypes[]=Banner
#AllowedTypes[]=Video
#AllowedTypes[]=TagCloud
#AllowedTypes[]=Poll
#AllowedTypes[]=ItemList
#AllowedTypes[]=FeedReader
#AllowedTypes[]=FeedbackForm
AllowedTypes[]=HighlightedItem
AllowedTypes[]=ExternalVideo
AllowedTypes[]=ApplicationInfo
AllowedTypes[]=ApplyHere
AllowedTypes[]=SingleItem
AllowedTypes[]=ContactList


[PushToBlock]
# List of content classes using Layout datatype
ContentClasses[]=hials_portal_page
ContentClasses[]=hials_utdanningstilbud
ContentClasses[]=hials_contentpage
ContentClasses[]=hials_avdeling
# The subtree node ID from which to fetch objects with Layout datatype
RootSubtree=1

[Campaign]
Name=Campaign
NumberOfValidItems=5
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default

[MainStory]
Name=Main story
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewList[]=highligted
ViewName[default]=Background Image
ViewName[highligted]=Highligted

[ContentGrid]
Name=Content Grid
NumberOfValidItems=8
NumberOfArchivedItems=8
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
#ViewList[]=1_column_4_rows
#ViewList[]=2_columns_2_rows
ViewList[]=1_column_2_rows
ViewList[]=4_columns_1_row
#ViewList[]=4_columns_2_rows
ViewName[default]=2 columns 1 row
#ViewName[1_column_4_rows]=1 column 4 rows
#ViewName[2_columns_2_rows]=2 columns 2 rows
ViewName[1_column_2_rows]=1 column 2 rows
ViewName[4_columns_1_row]=4 columns 1 row
#ViewName[4_columns_2_rows]=4 columns 2 rows

[Gallery]
Name=Gallery
NumberOfValidItems=8
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default

[Banner]
Name=Banner
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=image_node_id
CustomAttributes[]=url
CustomAttributes[]=path
CustomAttributes[]=code
CustomAttributeTypes[code]=text
CustomAttributeNames[url]=Target URL
CustomAttributeNames[path]=Image path
CustomAttributeNames[code]=JavaScript / XHTML code
UseBrowseMode[image_node_id]=true
ViewList[]
ViewList[]=default
ViewList[]=external
ViewList[]=code
ViewName[default]=Internal
ViewName[external]=External
ViewName[code]=Code

[Video]
Name=Video
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default

[TagCloud]
Name=Tag cloud
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=subtree_node_id
UseBrowseMode[subtree_node_id]=true
ViewList[]
ViewList[]=default
ViewName[default]=Default

[Poll]
Name=Poll
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=poll_node_id
UseBrowseMode[poll_node_id]=true
ViewList[]
ViewList[]=default
ViewName[default]=Default

[ItemList]
Name=Item list
NumberOfValidItems=12
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default

[FeedReader]
Name=Feed reader
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=source
CustomAttributes[]=limit
CustomAttributes[]=offset
ViewList[]
ViewList[]=default
ViewName[default]=Default

[FeedbackForm]
Name=Feedback Form
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default

[HighlightedItem]
Name=Highlighted Item
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=default
ViewName[default]=Default

# Custom blocks

[ExternalVideo]
Name=External Video
ManualAddingOfItems=disabled
CustomAttributes[]=source
CustomAttributes[]=width
CustomAttributes[]=aspectratio
CustomAttributeTypes[source]=text
CustomAttributeTypes[width]=select
CustomAttributeTypes[aspectratio]=select
CustomAttributeSelection_width[]
CustomAttributeSelection_width[1_col]=1 Col
CustomAttributeSelection_width[2_col]=2 Col
CustomAttributeSelection_aspectratio[]
CustomAttributeSelection_aspectratio[16by9]=16:9
CustomAttributeSelection_aspectratio[4by3]=4:3
ViewList[]
ViewList[]=default
ViewName[default]=Default

[ApplicationInfo]
Name=Application Information
ManualAddingOfItems=disabled
CustomAttributes[]=color
CustomAttributes[]=width
CustomAttributeTypes[color]=select
CustomAttributeTypes[width]=select
CustomAttributeSelection_color[]
CustomAttributeSelection_color[white]=White
CustomAttributeSelection_color[gray]=Gray
CustomAttributeSelection_width[]
CustomAttributeSelection_width[1_col]=1 Col
CustomAttributeSelection_width[2_col]=2 Col
ViewList[]
ViewList[]=default
ViewName[default]=Default

[ApplyHere]
Name=Apply here
ManualAddingOfItems=disabled
ViewList[]
ViewList[]=default
ViewList[]=1col
ViewName[default]=Default
ViewName[1col]=1 Column

[SingleItem]
Name=Single item
NumberOfValidItems=1
ManualAddingOfItems=enabled
CustomAttributes[]=color
CustomAttributeTypes[color]=select
CustomAttributeSelection_color[]
CustomAttributeSelection_color[white]=White
CustomAttributeSelection_color[gray]=Gray
ViewList[]
ViewList[]=default
ViewList[]=2col
ViewName[default]=Default
ViewName[2col]=2 Column

[ContactList]
Name=Contact list
NumberOfValidItems=5
ManualAddingOfItems=enabled
AllowedClasses[]
AllowedClasses[]=user
ViewList[]
ViewList[]=default
ViewName[default]=Default

*/ ?>
