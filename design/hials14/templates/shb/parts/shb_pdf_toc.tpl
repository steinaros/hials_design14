{switch match=$module_result.content_info.class_identifier}
	{case match='studiehandbok'}
	{/case}
	{case match='studie'}
	{/case}
	{case}{/case}
{/switch}
{*
<ol id="toc">
  <li><a href="#link_1">Chapter Title 1</a>
     <ol>
      <li><a href="#link_1_1">Chapter Title 1.1</a></li>
      <li><a href="#link_1_2">Chapter Title 1.2</a></li>
      <li><a href="#link_1_3">Chapter Title 1.3</a>
        <ol>
          <li><a href="#link_1_3_1">Chapter Title 1.3.1</a></li>
          <li><a href="#link_1_3_2">Chapter Title 1.3.2</a></li>
        </ol>
      </li>
     </ol>
  </li>
  <li><a href="#link_2">Chapter Title 2</a></li>
  <li><a href="#link_3">Chapter Title 3</a></li>
</ol>


eks
<h2><a name="link_1">Chapter Title 1</a></h2>
<h3><a name="link_1_1">Chapter Title 1.1</a></h3>
*}