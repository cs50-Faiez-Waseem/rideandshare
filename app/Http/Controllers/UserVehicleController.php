<?php

namespace App\Http\Controllers;

use App\Models\user_vehicle;
use Illuminate\Http\Request;
use Validator;

class UserVehicleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $record  = user_vehicle::where('user_id', '=', $request->user()->id)->get();
        
        return response()->json(['data'=> $record, 'status' => true]);
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
            'type' => 'required|string',
            'model' => 'required|string',
            'color' => 'required|string',
            'no' => 'required|string',
            'image' => 'required|string',
        ]);
        if($validator->fails()){
            return response()->json($validator->errors());       
        }

        $user_id =$request->user()->id;
        $record = new user_vehicle();
        $record->user_id = $user_id;
        $record->type = $request->input('type');
        $record->model = $request->input('model');
        $record->no = $request->input('no');
        $record->color = $request->input('color');
        $record->image = $request->input('image');
        
        $record->save();
        return response()->json(['data'=> $record, 'status' => true]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\user_vehicle  $user_vehicle
     * @return \Illuminate\Http\Response
     */
    public function show(user_vehicle $user_vehicle)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\user_vehicle  $user_vehicle
     * @return \Illuminate\Http\Response
     */
    public function edit(user_vehicle $user_vehicle)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\user_vehicle  $user_vehicle
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, user_vehicle $user_vehicle)
    {
        $validator = Validator::make($request->all(),[
            'type' => 'required|string',
            'model' => 'required|string',
            'color' => 'required|string',
            'no' => 'required|string',
            'image' => 'required|string',
            'id' => 'required|string'
        ]);
        if($validator->fails()){
            return response()->json($validator->errors());       
        }
        $affectedRows = user_vehicle::where([['id', '=', $request->id] , ['user_id' , '=' , $request->user()->id ]])->update([
            'type' => $request->type,
            'model' => $request->model,
            'color' => $request->color,
            'no' => $request->no,
            'image' => $request->image,
        ]);
        
        return response()->json(['status' => $affectedRows]);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\user_vehicle  $user_vehicle
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        if($request->has('id') && $request->filled('id')){
            $affectedRows = user_vehicle::where([['id', '=', $request->id] , ['user_id' , '=' , $request->user()->id]])->delete();
        }else{
            $affectedRows = user_vehicle::where('user_id', '=', $request->user()->id)->delete();
        }
        return response()->json([ 'status' => $affectedRows]);
    }
}
