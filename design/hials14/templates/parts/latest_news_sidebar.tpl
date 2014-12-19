{def $latest_news=fetch( 'content', 'tree', hash( parent_node_id, $root_node_id,
                                          class_filter_type, include,
                                          class_filter_array, array( 'hials_article' ),
                                          sort_by, array('published',false()),
                                          depth, 2,
                                          limit, 10 ) )}
<aside class="col-sm-3 col-right">
    {if $latest_news|count()}
    <p class="h3">{"Latest news"|i18n('hials/design/news')}</p>
    <ul class="list-unstyled">
    {foreach $latest_news as $news_item}
    <li><a href={$news_item.url_alias|ezurl}>{$news_item.name|wash()}</a></li>
    {/foreach}
    </ul>
    {/if}
</aside>
{undef $latest_news}