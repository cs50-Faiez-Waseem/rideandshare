<?php

namespace App\Http\Controllers;

use App\Models\user_address;
use Illuminate\Http\Request;
use Validator;


class UserAddressController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $record  = user_address::where('user_id', '=', $request->user()->id)->get();
        
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
            'address' => 'required|string|max:800',
            'alias' => 'string|nullable',
            'longitude' => 'string|nullable',
            'latitude' => 'string|nullable',
            'city' => 'string|nullable',
        ]);
        if($validator->fails()){
            return response()->json($validator->errors());       
        }
        $address = $request->input('address');
        $user_id =$request->user()->id;
        $record = new user_address();
        $record->user_id = $user_id;
        $record->address = $address;
        if($request->has('alias')){
           $record->alias =  $request->input('alias');
        }
        if($request->has('longitude')){
           $record->longitude =  $request->input('longitude');
        }
        if($request->has('latitude')){
           $record->latitude =  $request->input('latitude');
        }
        if($request->has('city')){
           $record->city =  $request->input('city');
        }
        $record->save();
        return response()->json(['data'=> $record, 'status' => true]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\user_address  $user_address
     * @return \Illuminate\Http\Response
     */
    public function show(user_address $user_address)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\user_address  $user_address
     * @return \Illuminate\Http\Response
     */
    public function edit(user_address $user_address)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\user_address  $user_address
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, user_address $user_address)
    {
        $validator = Validator::make($request->all(),[
            'address' => 'required|string|max:800',
            'alias' => 'string|nullable',
            'longitude' => 'string|nullable',
            'latitude' => 'string|nullable',
            'city' => 'string|nullable',
            'id' => 'string|nullable',
        ]);
        if($validator->fails()){
            return response()->json($validator->errors());       
        }
        if($request->has('id') && $request->filled('id')){
            if($request->has('alias') && $request->filled('alias')){
                $affectedRows = user_address::where([['id', '=', $request->id] , ['user_id' , '=' , $request->user()->id]])->update(['alias' =>  $request->input('alias')]);
            }
            if($request->has('address') && $request->filled('address')){
                $affectedRows = user_address::where([['id', '=', $request->id] , ['user_id' , '=' , $request->user()->id]])->update(['address' =>  $request->input('address')]);
            }
            if($request->has('longitude') && $request->filled('longitude')){
                $affectedRows = user_address::where([['id', '=', $request->id] , ['user_id' , '=' , $request->user()->id]])->update(['longitude' =>  $request->input('longitude')]);
            }
            if($request->has('latitude') && $request->filled('latitude')){
                $affectedRows = user_address::where([['id', '=', $request->id] , ['user_id' , '=' , $request->user()->id]])->update(['latitude' =>  $request->input('latitude')]);
            }
            if($request->has('city') && $request->filled('city')){
                $affectedRows = user_address::where([['id', '=', $request->id] , ['user_id' , '=' , $request->user()->id]])->update(['city' =>  $request->input('city')]);
            }
        }else{
            if($request->has('alias') && $request->filled('alias')){
                $affectedRows = user_address::where('user_id', '=', $request->user()->id)->update(['alias' =>  $request->input('alias')]);
            }
            if($request->has('address') && $request->filled('address')){
                $affectedRows = user_address::where('user_id', '=', $request->user()->id)->update(['address' =>  $request->input('address')]);
            }
            if($request->has('longitude') && $request->filled('longitude')){
                $affectedRows = user_address::where('user_id', '=', $request->user()->id)->update(['longitude' =>  $request->input('longitude')]);
            }
            if($request->has('latitude') && $request->filled('latitude')){
                $affectedRows = user_address::where('user_id', '=', $request->user()->id)->update(['latitude' =>  $request->input('latitude')]);
            }
            if($request->has('city') && $request->filled('city')){
                $affectedRows = user_address::where('user_id', '=', $request->user()->id)->update(['city' =>  $request->input('city')]);
            }
           
        }
        return response()->json([ 'status' => $affectedRows]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\user_address  $user_address
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        if($request->has('id') && $request->filled('id')){
            $affectedRows = user_address::where([['id', '=', $request->id] , ['user_id' , '=' , $request->user()->id]])->delete();
        }else{
            $affectedRows = user_address::where('user_id', '=', $request->user()->id)->delete();
        }
        return response()->json([ 'status' => $affectedRows]);
    }
}
