<?php

if (!function_exists('desktop_asset')) {
    /**
     * lấy đường dẫn asset desktop
     *
     * @param string $path
     * @return string
     */
    function desktop_asset($path = null)
    {
        // gọi hàm lấy đường dẫn tới thư mục asset của theme
        return theme_asset('desktop/' . $path, true);
    }
}
if (!function_exists('mobile_asset')) {
    /**
     * lấy đường dẫn asset mobile
     *
     * @param string $path
     * @return string
     */
    function mobile_asset($path = null)
    {
        // gọi hàm lấy đường dẫn tới thư mục asset của theme
        return theme_asset('mobile/' . $path, true);
    }
}


if (!function_exists('nooffood_affiliate_settings')) {
    /**
     * thêm dấu trang
     */
    function nooffood_affiliate_settings($id = null)
    {
        $data = null;
        if ($html = get_web_data('__html__')) {
            if ($affiliate_settings = $html->affiliate_settings) {
                if ($components = $affiliate_settings->components->getComponents()) {
                    foreach ($components as $comp) {
                        if ($comp->data->affiliate_id == $id) {
                            $data = $comp->data;
                        }
                    }
                }
            }
        }
        return $data;
    }
}



if (!function_exists('nf_text_to_array')) {
    /**
     * text to array key => value
     */
    function nf_text_to_array($str = null)
    {
        $data = [];
        if (is_string($str)) {
            $lines = explode("\n", $str);
            if (count($lines)) {
                foreach ($lines as $line) {
                    if ($trimLine = trim($line)) {
                        $parts = explode(';', $trimLine);
                        if (count($parts)) {
                            foreach ($parts as $part) {
                                if ($p = trim($part)) {
                                    if (count($keyVal = explode(':', $p)) >= 2) {
                                        if (strlen($key = array_shift($keyVal)) && strlen($val = implode(':', $keyVal))) {
                                            $data[$key] = $val;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return $data;
    }
}
