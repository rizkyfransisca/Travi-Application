<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;

use App\Models\EventFestival;

class TourPackageController extends Controller
{
    public function index(){
        return response()->json(
            EventFestival::all()
        );
    }
}
