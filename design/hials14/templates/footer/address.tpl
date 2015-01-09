{def $contact_node_id = ezini( 'HialsContentNodeIDs', 'KontaktOssID', 'hials.ini' )}
{def $contact_node = fetch( 'content', 'node', hash( 'node_id', $contact_node_id ) )}
<address class="container-sm-height">
    <div class="row-sm-height">
        <div class="col-sm-6 col-sm-height col-bottom">
            <p class="institusjonsnavn">H&oslash;gskolen i &Aring;lesund</p>
            <p><i class="fa fa-map-marker" style="color:#851348;"></i>&nbsp;<span class="p-street-address"><a href="https://www.google.no/maps/place/Larsgårdsvegen+2,+6009+Ålesund">Larsgårdsveien 2</a></span></p>
            {if $contact_node}<p><i class="fa fa-envelope" style="color:#7C1850"></i>&nbsp;<span><a href={$contact_node.url_alias|ezurl}>{'Contact us'|i18n('hials/design/pagelayout')}</a></span></p>
        </div>
        <div class="col-sm-6 col-sm-height col-bottom">
            <p><label>Tel:</label> <span class="p-tel">+47&nbsp;70&nbsp;16&nbsp;12&nbsp;00</span></p>
            <p><label>Fax:</label> <span>+47&nbsp;70&nbsp;16&nbsp;13&nbsp;00</span></p>
            <p class="u-email"><a href="mailto:postmottak@hials.no">postmottak@hials.no</a></p>
        </div>
    </div>
</address>