<?php

namespace Iml\CalcDelivery\Api;

class ApiErrorFactory
{

    public function throwErrorResponce($errorMessage)
    {
        throw new ApiFailure($errorMessage);
    }



    public function throwErrorWithConsoleMessage($errorMessage, $consoleMessage)
    {
        throw new ApiFailure($errorMessage, $consoleMessage);
    }
}
