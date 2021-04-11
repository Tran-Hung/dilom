<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateTravelRequest;
use App\Models\InformOrder;
use App\Models\Order;
use App\Models\Travel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Mockery\Exception;

class TravelController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->only(['booking']);
    }

    /**
     * View page find travel
     */
    public function index(Request $request) {
        $name = $request->name ?? null;
        $location_id = $request->location ?? 0;
        $check_in_at = $request->check_in_at ?? null;
        $check_out_at = $request->check_out_at ?? null;

        $travels = Travel::when($name, function ($q) use($name) {
          $q->where("name", "LIKE", "%". $name ."%");
        })
        ->when($location_id, function ($q) use($location_id) {
                $q->whereHas('location', function ($q) {
                    $q->where('area_type', AREA_SOUTH);
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

        return view("travel.index", compact(
            'travels',
            'name',
            'location_id',
            'check_in_at',
            'check_out_at'));
    }

    /**
     * Show travel detail
     *
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function show($id) {
        $travel = Travel::findOrFail($id);
        $relatedTravels = Travel::where('location_id', $travel->location_id)
            ->where('id', '!=', $travel->id)
            ->take(6)
            ->get();

        $recommendTravels = Travel::
            orderBy("id", "desc")
            ->orderBy("limit_user", "desc")
            ->take(6)
            ->get();

        return view('travel.show', compact('travel', 'relatedTravels', 'recommendTravels'));
    }

    /**
     * Show booking page
     *
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function booking($id) {
        $travel = Travel::findOrFail($id);

        return view('travel.booking', compact('travel'));
    }

    /**
     * Store newly order to database
     * @param CreateTravelRequest $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(CreateTravelRequest $request) {
        DB::beginTransaction();
        try {
            $name = $request->name ?? null;
            $email = $request->email ?? null;
            $phone = $request->phone ?? null;
            $address = $request->address ?? null;
            $quality = $request->quality ?? 0;
            $price = $request->price ?? 0;
            $paymentMethod = $request->payment_method ?? PAYMENT_METHOD_CASH;
            $travel_id = $request->travel_id ?? null;
            $note = $request->note ?? null;

            $order = new Order();
            $order->user_id = Auth::user()->id;
            $order->travel_id = $travel_id;
            $order->quality = $quality;
            $order->price = $price;
            $order->amount = $price * $quality;
            $order->save();

            $order->informOrder()->save(new InformOrder([
                "name" => $name,
                "email" => $email,
                "phone" => $phone,
                "address" => $address,
                "note" => $note,
                "payment_method" => $paymentMethod,
            ]));
            DB::commit();
        } catch (Exception $exception) {
            DB::rollBack();
        }

        return redirect()->route('orders.show', [
            "id" => $order->id,
        ])->with([
            "alert-success" => __("Tour booking is successful")
        ]);
    }
}
