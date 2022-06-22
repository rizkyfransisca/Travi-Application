<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;

use App\Models\TourPackage;

class TourPackageController extends Controller
{
    public function index(){
        return response()->json(
            TourPackage::all()
        );
    }
}