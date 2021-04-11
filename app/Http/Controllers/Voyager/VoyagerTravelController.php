<?php

namespace App\Http\Controllers\Voyager;

use App\Models\Travel;
use App\Models\TravelContent;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use TCG\Voyager\Http\Controllers\VoyagerBaseController as BaseVoyagerUserController;

class VoyagerTravelController extends BaseVoyagerUserController
{
    const EDIT_ADD_RULES = [
        "location" => "required",
        "name" => "required",
        "price" => "required",
        "limit_user" => "required|numeric|min:1",
        "check_in_at" => "date",
        "check_out_at" => "date",
        "body" => "required",
    ];

    /**
     * Store newly travel
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|void
     */
    public function store(Request $request) {
        $validateValid = $request->validate(array_merge(self::EDIT_ADD_RULES, [
            "image" => "required|file:jpg,jpeg,png",
        ]));

        if(!$validateValid) { return redirect()->back(); }

        DB::beginTransaction();

        try {
            $travel = Travel::create([
                "location_id" => $request->location,
                "name" => $request->name,
                "image" => "default.jpg",
                "price" => $request->price,
                "limit_user" => $request->limit_user,
                "check_in_at" => $request->check_in_at,
                "check_out_at" => $request->check_out_at,
            ]);

            $path = $this->uploadImage($request->file('image'));
            $travel->update([ "image" => $path ]);

            $travel->travelContent()->create([
                "content" => $request->body
            ]);

            DB::commit();
        } catch (\Exception $e) {
            dd($e->getMessage());
            DB::rollBack();
        }

        return redirect_after_store_updates(
            "voyager.travels.index",
            "Update travel '". $travel->name . "' successfully");
    }

    /**
     * Update travel by id
     *
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, $id)
    {
        $validateValid = $request->validate(array_merge(self::EDIT_ADD_RULES, [
            "image" => "file:jpg,jpeg,png",
        ]));

        if(!$validateValid) { return redirect()->back(); }

        DB::beginTransaction();

        try {
            $travel = Travel::find($id);
            $travel->update([
                "location_id" => $request->location,
                "name" => $request->name,
                "price" => $request->price,
                "limit_user" => $request->limit_user,
                "check_in_at" => $request->check_in_at,
                "check_out_at" => $request->check_out_at,
            ]);

            // If have upload image
            if($request->hasFile('image')) {
                $path = $this->uploadImage($request->file('image'));
                $travel->update([ "image" => $path ]);
            }

            $travel->travelContent()->update([
                "content" => $request->body
            ]);

            DB::commit();
        } catch (\Exception $e) {
            dd($e->getMessage());
            DB::rollBack();
        }

        return redirect_after_store_updates(
            "voyager.travels.index",
            "Update travel '". $travel->name . "' successfully");
    }

    /**
     * Upload and save image to storage
     *
     * @param $img
     * @return string
     */
    private function uploadImage($img) {
        $imgName = $img->getClientOriginalName();
        $imgExtension = $img->getClientOriginalExtension();

        $img = Image::make($img->getRealPath());
        $img->orientate()
            ->resize(720, 459)
            ->stream($imgExtension, 75)->detach();

        $path = "travels/". Carbon::now()->format('FY') . "/" . $imgName;
        Storage::disk('public')->put($path, $img);
        Storage::disk('public')->setVisibility($path, "public");

        return $path;
    }

    /**
     * Delete a travel
     *
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\RedirectResponse|void
     */
    public function destroy(Request $request, $id) {
        $ids = explode(',', $request->ids);
        TravelContent::whereIn("travel_id", $ids)->delete();

        return parent::destroy($request, $id);
    }
}
