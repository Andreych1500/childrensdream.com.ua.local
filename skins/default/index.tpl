<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link href="/skins/<?php echo Core::$SKIN; ?>/css/style.css" rel="stylesheet" type="text/css">
  <title><?php echo hsc(Core::$META['title']);?></title>
  <meta name="description" content="<?php echo hsc(Core::$META['descrition']); ?>">
  <meta name="keywords" content="<?php echo hsc(Core::$META['ketwords']); ?>">
  <script src="/vendor/public/jquery/dist/jquery.min.js"></script>
  <?php if(count(Core::$CSS)){ echo implode("\n",Core::$CSS); } ?>
  <?php if(count(Core::$JS)){ echo implode("\n",Core::$JS); } ?>
</head>

<body>

</body>
</html>