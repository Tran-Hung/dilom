<?php

namespace App\Http\Controllers;

use App\Models\Travel;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * View index page
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function index() {
        $take = 6;

        $hotTravels = Travel::take($take)->orderBy('limit_user', 'desc')->get();
        $latestTravels = Travel::take($take)->orderBy('id', 'desc')->get();
        $areaTravels = Travel::whereHas('location', function ($q) {
                $q->where('area_type', AREA_SOUTH);
            })
            ->take($take)
            ->orderBy('id', 'desc')
            ->get();

        return view('index', compact('hotTravels', 'latestTravels', 'areaTravels'));
    }
}
