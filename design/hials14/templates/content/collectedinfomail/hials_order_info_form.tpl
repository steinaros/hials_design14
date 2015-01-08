{set-block scope=root variable=subject}Bestilling av studiekatalog{/set-block}

{* Use this line to specify the email of receiver, sender and reply-to in the template,
   can read this from the object to make it dynamic pr form*}
{set-block scope=root variable=email_receiver}nospam@ez.no{/set-block}
{set-block scope=root variable=email_sender}custom_sender@example.com{/set-block}
{set-block scope=root variable=email_reply_to}custom_reply_to@example.com{/set-block}
{*
{set-block scope=root variable=email_cc_receivers}custom_cc_address@example.com{/set-block}
{set-block scope=root variable=email_bcc_receivers}custom_bcc_address@example.com{/set-block}
*}

{* Set this to redirect to another node
{set-block scope=root variable=redirect_to_node_id}2{/set-block}
*}

Jeg ønsker å få tilsendt studiekatalogen:

{foreach $collection.attributes as $attribute}
{$attribute.contentclass_attribute_name|wash}:
{attribute_result_gui view=info attribute=$attribute}
{/foreach}
