<?php
// тестова відправка листів
Mail::$to = 'andreychsavit2@gmail.com';
Mail::$subject = 'Registration';
Mail::$text = 'You have registered on the site, in order to confirm this by email please: ';
Mail::testsend();