<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
    /**
     * Display order index
     */
    public function index() {
        return view('order.index');
    }

    /**
     * Show order inform
     *
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function show($id) {
        return view('order.show');
    }

    /**
     * Data for orders table
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse|mixed
     * @throws \Exception
     */
    public function ordersData(Request $request) {
        $orders = Order::where([
          "user_id" => Auth::user()->id
        ])->with([
            "travel"
        ])->orderBy("id", "desc");

        return datatables($orders)->make(true);
    }
}
