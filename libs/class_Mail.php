<?php

class Mail
{
    static $subject = '';
    static $from = '';
    static $to = '';
    static $hidden_copy = '';
    static $text = '';
    static $headers = '';

    static function Send() {
        require_once($_SERVER['DOCUMENT_ROOT'].'/libs/PHPMailer/src/PHPMailer.php');

        $mail = new \PHPMailer\PHPMailer\PHPMailer;

        $mail->CharSet = 'UTF-8';
        $mail->setFrom(self::$from);
        $mail->addReplyTo(self::$from);
        $mail->addAddress(self::$to);
        $mail->Subject = self::$subject;
        $mail->msgHTML(self::$text);

        $mail->addCustomHeader("Precedence: bulk");  //лист в одну сторону...відповіді непотребує...приклад:після реєстрації*

        if (!empty(self::$hidden_copy)) {
            $mail->addBCC(self::$hidden_copy); // Скрита копія
        }

        return $mail->send();
    }
}