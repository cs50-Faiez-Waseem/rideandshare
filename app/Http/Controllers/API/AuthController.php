<?php
namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Auth;
use Validator;
use App\Models\User;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'username' => 'required|string|max:255',
            'phoneNo' => 'required|string|nullable|unique:users',
            'email' => 'required|string|nullable',
            'phoneNoVerfication' => 'required|string',
            'avatar' => 'required|string|nullable|max:255',
            'password' => 'required|string|min:6'
        ]);

        if($validator->fails()){
            return response()->json($validator->errors());       
        }

        $user = User::create([
            'username' => $request->username,
            'phoneNo' => $request->phoneNo,
            'avatar' => $request->avatar,
            'email' => $request->email,
            'phoneNoVerfication' => $request->phoneNoVerfication,
            'password' => Hash::make($request->password)
         ]);

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()
            ->json(['data' => $user,'access_token' => $token, 'token_type' => 'Bearer', ]);
    }

    public function login(Request $request)
    {
        if (!Auth::attempt($request->only('phoneNo', 'password')))
        {
            return response()
                ->json(['message' => 'Unauthorized' , 'data_recieved' => $request->password], 401);
        }

        $user = User::where('phoneNo', $request['phoneNo'])->firstOrFail();

        $token = $user->createToken('auth_token')->plainTextToken;

        return response()
            ->json(['message' => 'Hi '.$user->username.', welcome to home','access_token' => $token, 'token_type' => 'Bearer', ]);
    }

    // method for user logout and delete token
    public function logout()
    {
        auth()->user()->tokens()->delete();

        return [
            'message' => 'You have successfully logged out and the token was successfully deleted'
        ];
    }
    function updateUser(Request $request){

         if($request->phoneNoVerfication){
        
            $validator =  Validator::make($request->all(), ['phoneNoVerfication' => 'required|string|nullable',]);
             
            if($validator->fails()){
                return response()->json($validator->errors());       
            }
             User::where('id', $request->id)->update(['phoneNoVerfication' => $request->phoneNoVerfication]);
            }
         if($request->username){
        
            $validator =  Validator::make($request->all(), ['username' => 'required|string|max:255',]);
             
            if($validator->fails()){
                return response()->json($validator->errors());       
            }
             User::where('id', $request->id)->update(['username' => $request->username]);
            }

         if($request->email){
                $validator =  Validator::make($request->all(), ['email' => 'required|string|nullable']);
                if($validator->fails()){
                    return response()->json($validator->errors());       
                }
            User::where('id', $request->id)->update(['email' => $request->email]);
          }

        if($request->avatar){
            $validator =  Validator::make($request->all(), [ 'avatar' => 'required|string|nullable|max:255',]);
             
            if($validator->fails()){
                return response()->json($validator->errors());       
            }
            User::where('id', $request->id)->update(['avatar' => $request->avatar]);
         }
       
        return response()->json(['updated' => true]); 
    }
}