<?php

namespace App\Http\Controllers\Voyager;

use App\Models\InformUser;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Mockery\Exception;
use TCG\Voyager\Http\Controllers\VoyagerUserController as BaseVoyagerUserController;

class VoyagerUserController extends BaseVoyagerUserController
{
    const EDIT_ADD_RULES = [
        "name" => "required|max:99",
        "email" => "required|email|max:99",
        "phone" => "required",
        "address" => "required",
    ];

    /**
     * Store newly user
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
        $validateValid = $request->validate(array_merge(self::EDIT_ADD_RULES, [
            "password" => "required|min:6"
        ]));

        if(!$validateValid) {
            return redirect()->back();
        }

        try {
            DB::beginTransaction();

            $user = User::create([
                "name" => $request->name,
                "email" => $request->email,
                "password" => Hash::make($request->password),
            ])->informUser()->create([
                "phone" => $request->phone,
                "address" => $request->address,
            ]);

            DB::commit();
        } catch (Exception $exception) {
            DB::rollBack();
        }

        return redirect()->route('voyager.users.index')->with([
            'alert-type' => 'success',
            'message'    => "Create user ". $user->name ." successfully",
        ]);
    }

    /**
     * Update user by id
     *
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, $id)
    {
        $validateValid = $request->validate(array_merge(self::EDIT_ADD_RULES, []));
        if(!$validateValid) {
            return redirect()->back();
        }

        InformUser::where([
            "user_id" => $id,
        ])->update([
            "phone" => $request->phone,
            "address" => $request->address,
        ]);
        return parent::update($request, $id);
    }
}
