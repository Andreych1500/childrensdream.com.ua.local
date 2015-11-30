<?php 
class PR {
	static function pagination($all_page,$get_num,$view_cat,$n){
	
	if($all_page >= 2 && $get_num != 1) { 
		echo '<a class="stylepag_1" href="'.(($n == 1)? '/admin' : '').'/news?'.(isset($view_cat)? $view_cat : '').'num='.($get_num-1).'">&larr; На одну назад</a>';
	} 
	
		
	for($i = (($get_num==1)?$get_num:(($get_num==$all_page)?$get_num-2:$get_num-1)); $i <= (($get_num==1)?$get_num+2:$get_num+1); ++$i) {		
		if($i <= $all_page && $i >= 1) {
   			if ($i == $get_num) {
			    echo '<div class="active_page">'.$i.'</div>';
			} else { 
				echo '<a class="number" href="'.(($n == 1)? '/admin' : '').'/news?'.(isset($view_cat)? $view_cat : '').'num='.$i.'">'.$i.'</a>'; 
			} 
		}
	}
	
			
	if($all_page >= 2 && $get_num < $all_page) {
	    echo '<a class="stylepag_1" href="'.(($n == 1)? '/admin' : '').'/news?'.(isset($view_cat)? $view_cat : '').'num='.($get_num+1).'">На одну вперед &rarr;</a>';
	} 
	
	}
}