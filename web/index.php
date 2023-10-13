<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Style-Type" content="text/css">
    <meta name="generator" content="pandoc">
    <meta name="title" content="ECSSRIA 2024 - Sandbox">
    <title>combined_output</title>
    <style type="text/css">code {
            white-space: pre;
        }</style>
    <link rel="stylesheet" href="index_bestanden/template.css">
    <link href="index_bestanden/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- Include jQuery -->
    <script src="index_bestanden/jquery-3.6.0.min.js"></script>
</head>
<body class="search_plugin_added" cz-shortcut-listen="true">
<div class="region region-header">
    <div id="block-header" class="block block-block-content block-block-content0ad1bcdc-f0da-4df3-9738-6133a782f7ee">
        <div class="clearfix text-formatted field field--name-body field--type-text-with-summary field--label-hidden field__item">
            <div class="col-md-8 d-flex justify-content-center"><img class="img-fluid"
                                                                     src="index_bestanden/SRIA_web-top-banner.jpg"
                                                                     style="display:block; height:50px;"></div>
        </div>

    </div>

</div>
<div class="container">
    <div class='container mt-5'>
        <h1>HTML File Listing</h1>
        <ul class='list-group'>
            <?php
            // Get the current directory
            $currentDirectory = getcwd();

            // List all HTML files in the current directory
            $htmlFiles = glob("$currentDirectory/*.html");

            // Loop through the HTML files and display their filenames
            foreach ($htmlFiles as $file) {
                $fileName = basename($file);
                echo '<li class="list-group-item">' . $fileName . '</li>';
            }
            ?>
        </ul>
    </div>

</div>


</body>
</html>