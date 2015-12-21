<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('buildDataDropdown')) {

    function buildDataDropdown( $data = false, $optionValueName = false, $optionTextName = false ){
		$result = array();
		if( !empty($data) && !empty($optionValueName) && !empty($optionTextName) ) {
			$values = $data->result_array();
			$data->next_result();
			
			foreach( $values as $row ) {
				$value = $row[$optionValueName];
				$text = $row[$optionTextName];
				$result[$value] = $text;
			}
		}

		return $result;
	}
}

if ( ! function_exists('buildDataAutocomplete')) {

    function buildDataAutocomplete( $data = false, $optionValueName = false, $optionTextName = false ){
		$result = array();
		if( !empty($data) && !empty($optionValueName) && !empty($optionTextName) ) {
			foreach( $data as $row ) {
				$arr = array(
					'value' => $row[$optionValueName],
					'name' => $row[$optionTextName],
				);
				array_push($result, $arr);
			}
		}

		return $result;
	}
}