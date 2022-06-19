<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;

use App\Models\TourPackage;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use \Cviebrock\EloquentSluggable\Services\SlugService;

class TourPackageController extends Controller
{
    public function index(){
        return response()->json(
            TourPackage::all()
        );
    }
}
