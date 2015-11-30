<?php

class Smile{
	
	static function replace($text){
		
		$patterns[0] = "#\:\|\(\)#ui";
		$patterns[1] = "#\:\}\(\)#ui";
		$patterns[2] = "#\:\{\|\|#ui";
		$patterns[3] = "#\:\*\}\|#ui";
		$patterns[4] = "#\:\/\)\|#ui";
		$patterns[5] = "#\:\%\(\(#ui";
		$patterns[6] = "#\^\^\:\}#ui";
		$patterns[7] = "#\^\^\:\/#ui";
		$patterns[8] = "#\:\)\)\)#ui";
		$patterns[9] = "#\:\{\:\}#ui";
		$patterns[10] = "#\:\}\}\}#ui";
		$patterns[11] = "#\:\?\?\|#ui";
		$patterns[12] = "#\:\[\*\|#ui";
		$patterns[13] = "#\:\|\|\|#ui";
		$patterns[14] = "#\:\[\*\]#ui";
		$patterns[15] = "#\:\]\*\[#ui";
		$patterns[16] =  '#\:\$\$\|#ui';	
		$patterns[17] = "#\:\^\^\^#ui";
		$patterns[18] = "#\:\^\^\{#ui";
		$patterns[19] = "#\:\(\(\|#ui";
		$patterns[20] = "#\:\~\~\|#ui";
		$patterns[21] = "#\:\^\?\?#ui";
		$patterns[22] = "#\:\/\_\|#ui";

		
		$replacements[0] = '<img src="/skins/default/img/smiles/img0001.png" alt="/">';
		$replacements[1] = '<img src="/skins/default/img/smiles/img0002.png" alt="/">';
		$replacements[2] = '<img src="/skins/default/img/smiles/img0003.png" alt="/">';
		$replacements[3] = '<img src="/skins/default/img/smiles/img0004.png" alt="/">';
		$replacements[4] = '<img src="/skins/default/img/smiles/img0005.png" alt="/">';
		$replacements[5] = '<img src="/skins/default/img/smiles/img0006.png" alt="/">';
		$replacements[6] = '<img src="/skins/default/img/smiles/img0007.png" alt="/">';
		$replacements[7] = '<img src="/skins/default/img/smiles/img0008.png" alt="/">';
		$replacements[8] = '<img src="/skins/default/img/smiles/img0009.png" alt="/">';
		$replacements[9] = '<img src="/skins/default/img/smiles/img00010.png" alt="/">';
		$replacements[10] = '<img src="/skins/default/img/smiles/img00011.png" alt="/">';
		$replacements[11] = '<img src="/skins/default/img/smiles/img00012.png" alt="/">';
		$replacements[12] = '<img src="/skins/default/img/smiles/img00013.png" alt="/">';
		$replacements[13] = '<img src="/skins/default/img/smiles/img00014.png" alt="/">';
		$replacements[14] = '<img src="/skins/default/img/smiles/img00015.png" alt="/">';
		$replacements[15] = '<img src="/skins/default/img/smiles/img00016.png" alt="/">';
		$replacements[16] = '<img src="/skins/default/img/smiles/img00017.png" alt="/">';
		$replacements[17] = '<img src="/skins/default/img/smiles/img00018.png" alt="/">';
		$replacements[18] = '<img src="/skins/default/img/smiles/img00019.png" alt="/">';
		$replacements[19] = '<img src="/skins/default/img/smiles/img00020.png" alt="/">';
		$replacements[20] = '<img src="/skins/default/img/smiles/img00021.png" alt="/">';
		$replacements[21] = '<img src="/skins/default/img/smiles/img00022.png" alt="/">';
		$replacements[22] = '<img src="/skins/default/img/smiles/img00023.png" alt="/">';
		
		$text = preg_replace($patterns, $replacements, $text);
		return	$text;

		
	}

}
