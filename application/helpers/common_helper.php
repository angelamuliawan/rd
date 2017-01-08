<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('loadSubview')) {

    function loadSubview( $view, $data = false ) { 
	    $CI = &get_instance();
	    return $CI->load->view( 'Elements/Subview/'.$view, $data );
	}
}

if ( ! function_exists('loadModal')) {

    function loadModal( $view, $data = false) {
        $CI = &get_instance();
	    return $CI->load->view( 'Elements/Modal/'.$view, $data );
	}
}

if ( ! function_exists('tag')) {

	function tag( $tag, $text = false, $attributes = array() ) {
		$stringify_attributes = '';
		$wrapTag = false;
		$stringify_wrapper_attributes = '';

		if( $tag == 'img' && empty($attributes['data-disable-progressive']) ) {
			$CI = get_instance();

			$attributes['data-src'] = $attributes['src'];
			$attributes['src'] = $CI->domain.'/resources/images/placeholder/recipe.jpg';

			if( isset($attributes['img-progressive-loading']) ) {
				$attributes['src'] = $attributes['img-progressive-loading'];
			} else if( isset($attributes['img-progressive-type']) ) {
				if( $attributes['img-progressive-type'] == 'users' ) {
					$attributes['src'] = $CI->domain.'/resources/images/placeholder/users.jpg';
					unset($attributes['img-progressive-type']);
				}
			}
		} else if( $tag == 'div' && !empty($attributes['data-is-progressive']) ) {
			$CI = get_instance();
			if( isset($attributes['style']) ) {
				$attributes['style'] .= "background-image:url(".$CI->domain."/resources/images/placeholder/recipe.jpg)";
			} else {
				$attributes['style'] = "background-image:url(".$CI->domain."/resources/images/placeholder/recipe.jpg)";
			}
		}

		if( !empty($attributes) ) {
			foreach ($attributes as $attribute => $value) {
				if( $attribute == 'wrapTag' ) {
					$wrapTag = $value;
				} else if( $attribute == 'wrapAttributes' ) {
					foreach ($value as $wrapperAttribute => $wrapperValue) {
						$stringify_wrapper_attributes .= " $wrapperAttribute='$wrapperValue'";
					}
				} else {
					$stringify_attributes .= " $attribute='$value'";
		    	}
		    }
		}

		$tag = "<$tag" . $stringify_attributes . ">$text</$tag>";
		if( !empty($wrapTag) ) {
			$tag = "<$wrapTag" . $stringify_wrapper_attributes . ">$tag</$wrapTag>";
		}

	    return $tag;
	}
}

if ( ! function_exists('load_script')) {

	function load_script( $scripts = array() ) {
		$stringify_script = '';
		$CI = get_instance();

		if( !empty($scripts) ) {
			foreach ($scripts as $script) {
				$stringify_script .= "<script type='text/javascript' src='".$CI->static_domain.'/resources/js/'.$script.".js'></script>";
		    }
		}
	    
	    echo $stringify_script;
	}
}

if ( ! function_exists('load_jsx')) {

	function load_jsx( $scripts = array() ) {
		$stringify_script = '';
		$CI = get_instance();

		if( !empty($scripts) ) {
			foreach ($scripts as $script) {
				$stringify_script .= "<script type='text/babel' src='".$CI->static_domain.'/resources/jsx/'.$script.".js'></script>";
		    }
		}
	    
	    echo $stringify_script;
	}
}

if ( ! function_exists('load_css')) {

	function load_css( $scripts = array() ) {
		$stringify_script = '';
		$CI = get_instance();

		if( !empty($scripts) ) {
			foreach ($scripts as $script) {
		        $stringify_script .= "<link href='".$CI->static_domain.'/resources/css/'.$script.".css' rel='stylesheet'>";
		    }
		}
	    echo $stringify_script;
	}
}

if ( ! function_exists('debug')) {

	function debug( $param ){
		echo '<pre>';
		print_r($param);
		echo '</pre>';
	}
}

if ( ! function_exists('isLoggedIn')) {

	function isLoggedIn(){
		$CI = & get_instance();
		return ( $CI->session->userdata('loggedin') != NULL ) ? true : false;
	}
}

if ( ! function_exists('loadMessage')) {

	function loadMessage( $message = 'Field yang dibutuhkan tidak valid', $status = 'error', $display_on_error = false ) {
		$data = array(
			'message' => $message,
			'status' => $status,
			'display_on_error' => $display_on_error,
		);
		$CI = get_instance();
	    $CI->load->vars(array(
	    	'alert' => $CI->load->view( 'Elements/Message/message', $data, TRUE )
	    ));
	}
}

if ( ! function_exists('divider')) {

	function divider( $tag = 'li' ) {
		return "<$tag class='divider'></$tag>";
	}
}

if ( ! function_exists('tableCell')) {

	function tableCell( $data = array() ) {
		$tableData = '';
		foreach ($data as $value) {
			$tableData .= "<td>$value</td>";
		}
		$tableRow = "<tr>".$tableData."</tr>";
	    return $tableRow;
	}
}

if ( ! function_exists('seoURL')) {

	function seoURL($string) {
	    //Lower case everything
	    $string = strtolower($string);
	    //Make alphanumeric (removes all other characters)
	    $string = preg_replace("/[^a-z0-9_\s-]/", "", $string);
	    //Clean up multiple dashes or whitespaces
	    $string = preg_replace("/[\s-]+/", " ", $string);
	    //Convert whitespaces and underscore to dash
	    $string = preg_replace("/[\s_]/", "-", $string);
	    
	    return $string;
	}
}

if ( ! function_exists('getYoutubeIDFromURL')) {

	function getYoutubeIDFromURL( $url ) {
	    $parts = parse_url($url);
	    if(isset($parts['query'])){
	        parse_str($parts['query'], $qs);
	        if(isset($qs['v'])){
	            return $qs['v'];
	        }else if(isset($qs['vi'])){
	            return $qs['vi'];
	        }
	    }
	    if(isset($parts['path'])){
	        $path = explode('/', trim($parts['path'], '/'));
	        return $path[count($path)-1];
	    }
	    return false;
	}
}

if ( ! function_exists('isExistsYoutubeVideo')) {
	
	function isExistsYoutubeVideo( $videoID ) {
	    $theURL = "http://www.youtube.com/oembed?url=http://www.youtube.com/watch?v=$videoID&format=json";
	    $headers = get_headers($theURL);

	    if (substr($headers[0], 9, 3) !== "404") {
	        return true;
	    } else {
	        return false;
	    }
	}
}

if ( ! function_exists('isMobile')) {
	
	function isMobile() {
	    return preg_match("/(android|avantgo|blackberry|bolt|boost|cricket|docomo|fone|hiptop|mini|mobi|palm|phone|pie|tablet|up\.browser|up\.link|webos|wos)/i", $_SERVER["HTTP_USER_AGENT"]);
	}
}

if ( ! function_exists('customConcat')) {
	
	function customConcat( $str1, $str2 ) {
		$result = false;

		if( !empty($str1) ) {
			$result = $str1;
		}

		if( !empty($str2) && !empty($str1) ) {
			$result .= ', '.$str2;
		} else if( !empty($str2) ) {
			$result = $str2;
		}

		return $result;
	}
}

if ( ! function_exists('translateNotification')) {
	
	function translateNotification( $arr = array(), $site_lang = 'indonesian' ) {
		$result = false;
		$notif_code = isset( $arr['NotificationCode'] ) ? $arr['NotificationCode'] : false;

		if( !empty($notif_code) ) {
			$user_id 					= isset( $arr['ParamUserID'] ) ? $arr['ParamUserID'] : false;
			$recipe_id 					= isset( $arr['ParamRecipeID'] ) ? $arr['ParamRecipeID'] : false;
			$recook_id 					= isset( $arr['ParamRecookID'] ) ? $arr['ParamRecookID'] : false;
			$comment_id 				= isset( $arr['ParamCommentID'] ) ? $arr['ParamCommentID'] : false;
			$comment_reply_id 			= isset( $arr['ParamCommentReplyID'] ) ? $arr['ParamCommentReplyID'] : false;
			$recook_comment_id 			= isset( $arr['ParamRecookCommentID'] ) ? $arr['ParamRecookCommentID'] : false;
			$recook_comment_reply_id 	= isset( $arr['ParamRecookCommentReplyID'] ) ? $arr['ParamRecookCommentReplyID'] : false;

			$user_name 					= isset( $arr['UserName'] ) ? $arr['UserName'] : false;
			$recipe_name 				= isset( $arr['RecipeName'] ) ? $arr['RecipeName'] : false;
			$comment 					= isset( $arr['Comment'] ) ? $arr['Comment'] : false;
			$comment_reply 				= isset( $arr['CommentReply'] ) ? $arr['CommentReply'] : false;
			$recook_comment 			= isset( $arr['RecookComment'] ) ? $arr['RecookComment'] : false;
			$recook_comment_reply 		= isset( $arr['RecookCommentReply'] ) ? $arr['RecookCommentReply'] : false;

			if( $site_lang == 'indonesian' ) {

				if( $notif_code == '2-C-0' ) {
					$result = sprintf('<b>%s</b> mengomentari resep <b>%s</b>: %s', $user_name, $recipe_name, $comment);
				} else if( $notif_code == '2-C-ParticipateToComment' ) {
					$result = sprintf('<b>%s</b> ikut mengomentari resep <b>%s</b>', $user_name, $recipe_name);
				} else if( $notif_code == '2-A-0' ) {
					$result = sprintf('<b>%s</b> memasak ulang resep <b>%s</b>', $user_name, $recipe_name);
				} else if( $notif_code == '2-B-0' ) {
					$result = sprintf('<b>%s</b> menandai resep <b>%s</b>', $user_name, $recipe_name);
				} else if( $notif_code == '3-C-0' ) {
					$result = sprintf('<b>%s</b> mengomentari recook <b>%s</b>: %s', $user_name, $recipe_name, $recook_comment);
				} else if( $notif_code == '3-C-ParticipateToComment' ) {
					$result = sprintf('<b>%s</b> ikut mengomentari recook <b>%s</b>', $user_name, $recipe_name);
				} else if( $notif_code == '1-Completion' ) {
					$result = sprintf('Lengkapi data Anda di halaman pengaturan akun');
				} else if( $notif_code == '2-E-0' ) {
					$result = sprintf('<b>%s</b> menyukai resep <b>%s</b>', $user_name, $recipe_name);
				} else if( $notif_code == '3-E-0' ) {
					$result = sprintf('<b>%s</b> menyukai recook <b>%s</b>', $user_name, $recipe_name);
				} else if( $notif_code == '2-C-E' ) {
					$result = sprintf('<b>%s</b> menyukai komentar Anda: %s', $user_name, $comment);
				} else if( $notif_code == '3-C-E' ) {
					$result = sprintf('<b>%s</b> menyukai komentar Anda: %s', $user_name, $recook_comment);
				} else if( $notif_code == '2-C-D-E' ) {
					$result = sprintf('<b>%s</b> menyukai balasan komentar Anda: %s', $user_name, $comment_reply);
				} else if( $notif_code == '3-C-D-E' ) {
					$result = sprintf('<b>%s</b> menyukai balasan komentar Anda: %s', $user_name, $recook_comment_reply);
				} else if( $notif_code == '2-C-D' ) {
					$result = sprintf('<b>%s</b> membalas komentar Anda: %s', $user_name, $comment_reply);
				} else if( $notif_code == '3-C-D' ) {
					$result = sprintf('<b>%s</b> membalas komentar Anda: %s', $user_name, $recook_comment_reply);
				} else if( $notif_code == '1-F-0' ) {
					$result = sprintf('<b>%s</b> mulai mengikuti Anda', $user_name);
				}

			} else if( $site_lang == 'english' ) {
				if( $notif_code == '2-C-0' ) {
					$result = sprintf('<b>%s</b> commented on recipe <b>%s</b>: %s', $user_name, $recipe_name, $comment);
				} else if( $notif_code == '2-C-ParticipateToComment' ) {
					$result = sprintf('<b>%s</b> also commented on recipe <b>%s</b>', $user_name, $recipe_name);
				} else if( $notif_code == '2-A-0' ) {
					$result = sprintf('<b>%s</b> recooked your recipe <b>%s</b>', $user_name, $recipe_name);
				} else if( $notif_code == '2-B-0' ) {
					$result = sprintf('<b>%s</b> cookmarked your recipe <b>%s</b>', $user_name, $recipe_name);
				} else if( $notif_code == '3-C-0' ) {
					$result = sprintf('<b>%s</b> commented on recook <b>%s</b>: %s', $user_name, $recipe_name, $recook_comment);
				} else if( $notif_code == '3-C-ParticipateToComment' ) {
					$result = sprintf('<b>%s</b> also commented on recook <b>%s</b>', $user_name, $recipe_name);
				} else if( $notif_code == '1-Completion' ) {
					$result = sprintf('Please complete your profile on Account Setting page');
				} else if( $notif_code == '2-E-0' ) {
					$result = sprintf('<b>%s</b> likes your recipe <b>%s</b>', $user_name, $recipe_name);
				} else if( $notif_code == '3-E-0' ) {
					$result = sprintf('<b>%s</b> likes your recook <b>%s</b>', $user_name, $recipe_name);
				} else if( $notif_code == '2-C-E' ) {
					$result = sprintf('<b>%s</b> likes your comment: %s', $user_name, $comment);
				} else if( $notif_code == '3-C-E' ) {
					$result = sprintf('<b>%s</b> likes your comment: %s', $user_name, $recook_comment);
				} else if( $notif_code == '2-C-D-E' ) {
					$result = sprintf('<b>%s</b> likes your reply: %s', $user_name, $comment_reply);
				} else if( $notif_code == '3-C-D-E' ) {
					$result = sprintf('<b>%s</b> likes your reply: %s', $user_name, $recook_comment_reply);
				} else if( $notif_code == '2-C-D' ) {
					$result = sprintf('<b>%s</b> replied your comment: %s', $user_name, $comment_reply);
				} else if( $notif_code == '3-C-D' ) {
					$result = sprintf('<b>%s</b> replied your comment: %s', $user_name, $recook_comment_reply);
				} else if( $notif_code == '1-F-0' ) {
					$result = sprintf('<b>%s</b> started following you', $user_name);
				}
			}
		}

		return $result;
	}
}

if ( ! function_exists('getNotificationURL')) {
	
	function getNotificationURL( $arr = array() ) {
		$result = false;
		$notif_code = isset( $arr['NotificationCode'] ) ? $arr['NotificationCode'] : false;

		if( !empty($notif_code) ) {
			$user_id 					= isset( $arr['ParamUserID'] ) ? $arr['ParamUserID'] : false;
			$recipe_id 					= isset( $arr['ParamRecipeID'] ) ? $arr['ParamRecipeID'] : false;
			$recook_id 					= isset( $arr['ParamRecookID'] ) ? $arr['ParamRecookID'] : false;
			$comment_id 				= isset( $arr['ParamCommentID'] ) ? $arr['ParamCommentID'] : false;
			$comment_reply_id 			= isset( $arr['ParamCommentReplyID'] ) ? $arr['ParamCommentReplyID'] : false;
			$recook_comment_id 			= isset( $arr['ParamRecookCommentID'] ) ? $arr['ParamRecookCommentID'] : false;
			$recook_comment_reply_id 	= isset( $arr['ParamRecookCommentReplyID'] ) ? $arr['ParamRecookCommentReplyID'] : false;

			if( $notif_code == '2-C-0' ) {
				$result = sprintf('p/%s', $recipe_id);
			} else if( $notif_code == '2-C-ParticipateToComment' ) {
				$result = sprintf('p/%s', $recipe_id);
			} else if( $notif_code == '2-A-0' ) {
				$result = sprintf('p/%s', $recipe_id);
			} else if( $notif_code == '2-B-0' ) {
				$result = sprintf('p/%s', $recipe_id);
			} else if( $notif_code == '3-C-0' ) {
				$result = sprintf('recook/%s', $recook_id);
			} else if( $notif_code == '3-C-ParticipateToComment' ) {
				$result = sprintf('recook/%s', $recook_id);
			} else if( $notif_code == '1-Completion' ) {
				$result = sprintf('users/');
			} else if( $notif_code == '2-E-0' ) {
				$result = sprintf('p/%s', $recipe_id);
			} else if( $notif_code == '3-E-0' ) {
				$result = sprintf('recook/%s', $recook_id);
			} else if( $notif_code == '2-C-E' ) {
				$result = sprintf('p/%s', $recipe_id);
			} else if( $notif_code == '3-C-E' ) {
				$result = sprintf('recook/%s', $recook_id);
			} else if( $notif_code == '2-C-D-E' ) {
				$result = sprintf('p/%s', $recipe_id);
			} else if( $notif_code == '3-C-D-E' ) {
				$result = sprintf('recook/%s', $recook_id);
			} else if( $notif_code == '2-C-D' ) {
				$result = sprintf('p/%s', $recipe_id);
			} else if( $notif_code == '3-C-D' ) {
				$result = sprintf('recook/%s', $recook_id);
			} else if( $notif_code == '1-F-0' ) {
				$result = sprintf('users/profile/%s', $user_id);
			}
		}

		return $result;
	}
}

if ( ! function_exists('getNotificationIcon')) {
	
	function getNotificationIcon( $notif_code = false ) {

		$class = false;
		$result = false;

		if( !empty($notif_code) ) {
			if( $notif_code == '2-C-0' || $notif_code == '2-C-ParticipateToComment' || $notif_code == '3-C-0' || $notif_code == '3-C-ParticipateToComment' || $notif_code == '2-C-D' || $notif_code == '3-C-D' ) {
				$class = 'comment-icon glyphicon-comment';
			} else if( $notif_code == '2-A-0' ) {
				$class = 'recook-icon glyphicon-retweet';
			} else if( $notif_code == '2-B-0' ) {
				$class = 'cookmark-icon glyphicon-bookmark';
			} else if( $notif_code == '1-Completion' ) {
				$class = 'setting-icon glyphicon-cog';
			} else if( $notif_code == '2-E-0' || $notif_code == '3-E-0' ) {
				$class = 'love-icon glyphicon-heart';
			} else if( $notif_code == '2-C-E' || $notif_code == '3-C-E' || $notif_code == '2-C-D-E' || $notif_code == '3-C-D-E' ) {
				$class = 'like-icon glyphicon-thumbs-up';
			} else if( $notif_code == '1-F-0' ) {
				$class = 'user-icon glyphicon-user';
			}
		}

		if( !empty($class) ) {
			$result = tag('span', false, array(
				'class' => 'notif-icon glyphicon ' . $class,
			));
		}

		return $result;
	}
}

if ( ! function_exists('timeAgoFormat')) {
	function timeAgoFormat( $time ) {

        $out    = ''; // what we will print out
        $now    = time(); // current time
        $diff   = $now - $time; // difference between the current and the provided dates

        if( $diff < 60 ) // it happened now
            return lang('timebefore_now');

        elseif( $diff < 3600 ) // it happened X minutes ago
            return str_replace( '{num}', ( $out = round( $diff / 60 ) ), $out == 1 ? lang('timebefore_minute') : lang('timebefore_minutes') );

        elseif( $diff < 3600 * 24 ) // it happened X hours ago
            return str_replace( '{num}', ( $out = round( $diff / 3600 ) ), $out == 1 ? lang('timebefore_hour') : lang('timebefore_hours') );

        elseif( $diff < 3600 * 24 * 2 ) // it happened yesterday
            return strftime( lang('timebefore_yesterday'), $time );

        else // falling back on a usual date format as it happened later than yesterday
            return strftime( date( 'Y', $time ) == date( 'Y' ) ? lang('timebefore_format') : lang('timebefore_format_year'), $time );
    }
}