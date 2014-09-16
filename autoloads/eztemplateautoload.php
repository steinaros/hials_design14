<?php

$eZTemplateOperatorArray = array();

//$eZTemplateOperatorArray[] = array( 'script' => 'extension/ezdemo/autoloads/ezkeywordlist.php',
//                                    'class' => 'eZKeywordList',
//                                    'operator_names' => array( 'ezkeywordlist' ) );
//$eZTemplateOperatorArray[] = array( 'script' => 'extension/ezdemo/autoloads/ezarchive.php',
//                                    'class' => 'eZArchive',
//                                    'operator_names' => array( 'ezarchive' ) );
//$eZTemplateOperatorArray[] = array( 'script' => 'extension/ezdemo/autoloads/eztagcloud.php',
//                                    'class' => 'eZTagCloud',
//                                    'operator_names' => array( 'eztagcloud' ) );
$eZTemplateOperatorArray[] = array( 'script' => 'extension/hials_design14/autoloads/ezpagedata.php',
                                    'class' => 'eZPageData',
                                    'operator_names' => array( 'ezpagedata', 'ezpagedata_set', 'ezpagedata_append' ) );
?>
