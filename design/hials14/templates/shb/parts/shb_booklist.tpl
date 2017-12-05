{def $books=array()
     $literature_filter=array( true(), false() )
     $headingswitch=false()}
{foreach $literature_filter as $filter}
    {set $books=fetch('content', 'list', hash( 'parent_node_id', $node.main_node_id, 
                                               'sort_by', array("name", true()),
                                               'attribute_filter', array( array( 'bok/obligatorisk', '=', $filter ) ),
                                               'class_filter_type', "include", 
                                               'class_filter_array', array(ezini('Studiehandbokklasser','bok') ) ) ) }
    {if and(ne(count($books),0), eq($headingswitch, false()))}
        <h3>{"Literature"|i18n('hials/design/shb/booklist')}</h3>
        {set $headingswitch=true()}
    {/if}
    {if and(ne(count($books),0), eq($filter, true()))}
        <h4>{"Mandatory"|i18n('hials/design/shb/booklist')}</h4>
    {elseif and(ne(count($books),0), eq($filter, false()))}
        <h4>{"Supplementary"|i18n('hials/design/shb/booklist')}</h4>
    {/if}
  
    {if ne(count($books),0)}
    <ul>
    {foreach $books as $book}
        {switch match=$book.data_map.type.content[0]}
            {case match=8}{*Webside*}
            <li>{attribute_view_gui attribute=$book.data_map.tittel}, {attribute_view_gui attribute=$book.data_map.kommentar}</li>
            {/case}

	        {case}
	        <li>{if and($book.data_map.forfatter.has_content, ne($book.data_map.forfatter.content, ''), ne( $book.data_map.forfatter.data_text|striptags|wstrim, ''))}{attribute_view_gui attribute=$book.data_map.forfatter}: {/if}
{if and($book.data_map.tittel.has_content, ne($book.data_map.tittel.content, ''), ne( $book.data_map.tittel.data_text|striptags|wstrim, ''))}{attribute_view_gui attribute=$book.data_map.tittel}{/if}
{if and($book.data_map.forlag.has_content, ne($book.data_map.forlag.content, ''), ne( $book.data_map.forlag.data_text|striptags|wstrim, ''))}, {attribute_view_gui attribute=$book.data_map.forlag}{/if}
{if and($book.data_map.utgitt.has_content, ne($book.data_map.utgitt.content, ''), ne( $book.data_map.utgitt.data_text|striptags|wstrim, ''))} ({$book.data_map.utgitt.content|trim()}){/if}
{if and($book.data_map.isbn.has_content, ne($book.data_map.isbn.content, ''), ne( $book.data_map.isbn.data_text|striptags|wstrim, ''))}, ISBN: {attribute_view_gui attribute=$book.data_map.isbn}{/if}
{if and($book.data_map.sider.has_content, ne($book.data_map.sider.content, ''), ne( $book.data_map.sider.data_text|striptags|wstrim, ''))}, {attribute_view_gui attribute=$book.data_map.sider}{/if}
{if and($book.data_map.kommentar.has_content, ne($book.data_map.kommentar.content, ''), ne( $book.data_map.kommentar.data_text|striptags|wstrim, ''))}, {attribute_view_gui attribute=$book.data_map.kommentar}{/if}</li>
	        {/case}
        {/switch}
    {/foreach}
    </ul>
    {/if}
{/foreach}
{undef $books $litterature_filter $headingswitch}