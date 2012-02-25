<?php

	include_once('simple_html_dom.php');
	
	function exception_handler($exception) {
          echo "Uncaught exception: " , $exception->getMessage();
          echo var_dump($exception->getTrace());
    }

    set_exception_handler('exception_handler');
	
	function handleError($errno, $errstr,$error_file,$error_line)
    {
     echo "<b>Error:</b> [$errno] $errstr - $error_file:$error_line";
     echo "<br />";
     echo "Terminating PHP Script";
     die();
    }
    //set error handler
    set_error_handler("handleError");
	
	assert_options (ASSERT_ACTIVE, 1);
    assert_options (ASSERT_WARNING, 0);
    assert_options (ASSERT_QUIET_EVAL, 1);
	assert_options (ASSERT_CALLBACK, 'my_assert_handler');
	
	function my_assert_handler ($file, $line, $code) {
        echo "<hr>Assertion Failed:
        File '$file'<br>
        Line '$line'<br>
        Code '$code'<br><hr>";
    }
	
	#ob_start('handleShutdown');

    function handleShutdown() {
    print_r(error_get_last());
    global $a;
    print_r($a);
                $buffer = ob_get_contents();
                #ob_clean();
                $msg= $buffer;
                echo $msg;
                $um ='We have found some error please try again later.';
                ob_start();
                $buffer = ob_get_contents();
                ob_end_clean();
                echo $buffer;
                
                exit();
    }
    
    register_shutdown_function('handleShutdown');
	
	$html = new simple_html_dom();
	$html->load('<html><div><a>asdasd</a></div></html>');
	$a = $html->find('div');
	print $a[0]->innertext;
	try{
    	$a->find('a',0);
	}
	catch(Exception $e) {
		print "11111";
	}

	#var_dump($b);

?>
