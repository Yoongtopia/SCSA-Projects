package com.example.scsa;

import android.os.Bundle;

import org.apache.cordova.*;

import com.plugin.gcm.GCMIntentService;


public class SubActivity extends CordovaActivity {

    @Override
    public void onPostCreate(Bundle savedInstanceState)
    {
        super.onPostCreate(savedInstanceState);
        
    	int product_num = Integer.parseInt(this.getIntent().getStringExtra("pnum"));
        super.loadUrl("http://70.12.109.72:8080/gommelier/m_product_detail.do?product_num="+product_num);
        GCMIntentService.cancelNotification(this);
    }
    
}

