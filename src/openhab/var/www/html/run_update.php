<?php
// Send out the data as soon as we have it.
ini_set("output_buffering", "0");
?>
<!DOCTYPE html>
<html>
<head><title>Scorpio Climate - Updater</title></head>
<body>
<h1>Scorpio Climate - Updater</h1>

<p>Starting update...</p>

<pre>
<?php
system("/usr/bin/sudo /usr/bin/scorpio_run_update")
?>
</pre>

<p>Update ended...</p>

</body>
</html>
