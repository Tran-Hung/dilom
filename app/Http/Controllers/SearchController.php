<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateTravelRequest;
use App\Models\Location;
use App\Models\Travel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Mockery\Exception;

class SearchController extends Controller
{

    /**
     * View page find travel
     */
    public function index(Request $request) {
        $name = $request->name ?? null;
        $location_id = $request->location ?? 0;
        $check_in_at = $request->check_in_at ?? null;
        $check_out_at = $request->check_out_at ?? null;
        
        // Get data and search
        $travels = Travel::when($name, function ($q) use($name) {
          $q->where("name", "LIKE", "%". $name ."%");
        })
        ->when($location_id, function ($q) use($location_id) {
                $q->whereHas('location', function ($q) use($location_id) {
                    $q->where('location_id', $location_id);
                });
            })
        ->when($check_in_at, function ($q) use($check_in_at) {
            $q->whereDate("check_in_at", ">=", $check_in_at);
        })
        ->when($check_out_at, function ($q) use($check_out_at) {
            $q->whereDate("check_out_at", "<=", $check_out_at);
        })
        ->orderBy('id', 'desc')
        ->paginate(20);

        return view("search.index", compact(
            'travels',
            'name',
            'location_id',
            'check_in_at',
            'check_out_at'));
    }
}
