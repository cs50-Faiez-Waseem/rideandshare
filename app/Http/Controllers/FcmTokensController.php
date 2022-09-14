<?php

namespace App\Http\Controllers;

use App\Models\fcm_tokens;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Validator;
use Auth;
class FcmTokensController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       return response()->json(['message' => "Hey y000 why u here , this ai'nt workin!. "]);
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
        $validator = Validator::make($request->all(),[
            'token' => 'required|string|max:800',
        ]);
        if($validator->fails()){
            return response()->json($validator->errors());       
        }
        $token = $request->input('token');
        $user_id =$request->user()->id;
        $record = new fcm_tokens();
        $record->user_id = $user_id;
        $record->token = $token;
        $record->save();
        return response()->json(['data'=> $record, 'status' => true]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\fcm_tokens  $fcm_tokens
     * @return \Illuminate\Http\Response
     */
    public function show(fcm_tokens $fcm_tokens)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\fcm_tokens  $fcm_tokens
     * @return \Illuminate\Http\Response
     */
    public function edit(fcm_tokens $fcm_tokens)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\fcm_tokens  $fcm_tokens
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, fcm_tokens $fcm_tokens)
    {
        $validator = Validator::make($request->all(),[
            'token' => 'required|string|max:800',
        ]);
        if($validator->fails()){
            return response()->json($validator->errors());       
        }
        $affectedRows = fcm_tokens::where('user_id', '=', $request->user()->id)->update(['token' =>  $request->input('token')]);
        return response()->json([ 'status' => $affectedRows]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\fcm_tokens  $fcm_tokens
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
       
        $affectedRows = fcm_tokens::where('user_id', '=', $request->user()->id)->delete();
        return response()->json([ 'status' => $affectedRows]);
    }
}
