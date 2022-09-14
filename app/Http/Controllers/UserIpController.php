<?php

namespace App\Http\Controllers;

use App\Models\user_ip;
use Illuminate\Http\Request;

class UserIpController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $record = new user_ip();
        $record->user_id = $request->user()->id;
        $record->ip = $request->ip();
        $record->save();
        return response()->json(['data'=> $record, 'status' => true]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\user_ip  $user_ip
     * @return \Illuminate\Http\Response
     */
    public function show(user_ip $user_ip)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\user_ip  $user_ip
     * @return \Illuminate\Http\Response
     */
    public function edit(user_ip $user_ip)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\user_ip  $user_ip
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, user_ip $user_ip)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\user_ip  $user_ip
     * @return \Illuminate\Http\Response
     */
    public function destroy(user_ip $user_ip)
    {
        //
    }
}
