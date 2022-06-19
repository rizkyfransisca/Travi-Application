<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;

use App\Models\Destination;

class TourPackageController extends Controller
{
    public function index(){
        return response()->json(
            Destination::all()
        );
    }
}
