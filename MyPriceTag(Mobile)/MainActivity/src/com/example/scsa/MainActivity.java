/*
       Licensed to the Apache Software Foundation (ASF) under one
       or more contributor license agreements.  See the NOTICE file
       distributed with this work for additional information
       regarding copyright ownership.  The ASF licenses this file
       to you under the Apache License, Version 2.0 (the
       "License"); you may not use this file except in compliance
       with the License.  You may obtain a copy of the License at

         http://www.apache.org/licenses/LICENSE-2.0

       Unless required by applicable law or agreed to in writing,
       software distributed under the License is distributed on an
       "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
       KIND, either express or implied.  See the License for the
       specific language governing permissions and limitations
       under the License.
 */

package com.example.scsa;

import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import org.apache.cordova.*;

import com.google.android.gcm.GCMRegistrar;
import com.plugin.gcm.GCMIntentService;

public class MainActivity extends CordovaActivity 
{
	
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        super.init();
      //  registGCM();
        // Set by <content src="index.html" /> in config.xml
        super.loadUrl(Config.getStartUrl());
        //super.loadUrl("file:///android_asset/www/index.html?product_num="+product_num);
        //super.loadUrl("file:///android_asset/www/index.html");
        //super.loadUrl("file:///android_asset/www/index.html");
    }
    
/*    private void registGCM() {
		GCMRegistrar.checkDevice(this);
		GCMRegistrar.checkManifest(this);
		
		final String regId = GCMRegistrar.getRegistrationId(this);
		
		if("".equals(regId)){   
			Log.d("MainActivity","GCM register...............");
			GCMRegistrar.register(this, "323760448008");
		}else{
			Log.d("MainActivity", regId);
		}
    }*/
}

