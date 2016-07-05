package com.plugin.gcm;

import java.io.*;
import java.net.URLEncoder;
import java.util.Iterator;

import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.json.JSONException;
import org.json.JSONObject;

import android.annotation.SuppressLint;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.app.NotificationCompat;
import android.util.Log;
import android.widget.Toast;

import com.example.scsa.SubActivity;
import com.google.android.gcm.GCMBaseIntentService;

@SuppressLint("NewApi")
public class GCMIntentService extends GCMBaseIntentService {

	public static final int NOTIFICATION_ID = 237;
	private static final String TAG = "GCMIntentService";
	
	
	public GCMIntentService() {
		super("GCMIntentService");
	}

	@Override
	public void onRegistered(Context context, String regId) {

		Log.v(TAG, "onRegistered: "+ regId);

		JSONObject json;

		try
		{
			json = new JSONObject().put("event", "registered");
			json.put("regid", regId);

			Log.v(TAG, "onRegistered: " + json.toString());

			// Send this JSON data to the JavaScript application above EVENT should be set to the msg type
			// In this case this is the registration ID
			PushPlugin.sendJavascript( json );

		}
		catch( JSONException e)
		{
			// No message to the user is sent, JSON failed
			Log.e(TAG, "onRegistered: JSON exception");
		}
	}

	@Override
	public void onUnregistered(Context context, String regId) {
		Log.d(TAG, "onUnregistered - regId: " + regId);
	}

	private String pnum;
	@Override
	protected void onMessage(Context context, Intent intent) {
		Log.d(TAG, "onMessage - context: " + context);

		// Extract the payload from the message
		Bundle extras = intent.getExtras();
	

		final StringBuffer msg = new StringBuffer();
		String key = null;
		Iterator<String> iterator = extras.keySet().iterator();
		String tag = null;
		
        while(iterator.hasNext()) {
        	key = iterator.next();
        	if (key.equalsIgnoreCase("product_num")) {
        		pnum = extras.get(key).toString();
			} else if (key.equalsIgnoreCase("tag"))  {
				tag = extras.get(key).toString();
			}
        }
		String tag1 = tag.substring(4);
		String tag2= tag1.trim().replaceAll("\"", "").replace(",", ", ");   
		
        extras.putString("message",tag2+" 상품이 등록되었습니다.");
        extras.putString("msgcnt", "0");
        createNotification(context, extras);
        
        
        
        Handler h = new Handler(Looper.getMainLooper());
		h.post(new Runnable() {
			public void run() {
				Toast.makeText(GCMIntentService.this, "푸쉬 요청하신 상품이 등록되었습니다.",
						Toast.LENGTH_LONG).show();

			}
		});
		


  /*      if (extras != null){
			// if we are in the foreground, just surface the payload, else post it to the statusbar
            if (PushPlugin.isInForeground()) {
				extras.putBoolean("foreground", true);
                PushPlugin.sendExtras(extras);
			}
			else {
				extras.putBoolean("foreground", false);

                // Send a notification if there is a message
                if (extras.getString("message") != null && extras.getString("message").length() != 0) {
                    createNotification(context, extras);
                }
            }
        }*/
	}
	
	



	public void createNotification(Context context, Bundle extras)
	{
		NotificationManager mNotificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
		String appName = getAppName(this);

		Intent notificationIntent = new Intent(this, SubActivity.class);
		notificationIntent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP | Intent.FLAG_ACTIVITY_CLEAR_TOP);
		notificationIntent.putExtra("pushBundle", extras);
		notificationIntent.putExtra("pnum", pnum);

		PendingIntent contentIntent = PendingIntent.getActivity(this, 0, notificationIntent, PendingIntent.FLAG_UPDATE_CURRENT);
		
		NotificationCompat.Builder mBuilder =
			new NotificationCompat.Builder(context)
				.setDefaults(Notification.DEFAULT_ALL)
				.setSmallIcon(context.getApplicationInfo().icon)
				.setWhen(System.currentTimeMillis())
				.setContentTitle(extras.getString("title"))
				.setTicker(extras.getString("title"))
				.setContentIntent(contentIntent);

		String message = extras.getString("message");
		if (message != null) {
			mBuilder.setContentText(message);
		} else {
			mBuilder.setContentText("<missing message content>");
		}

		String msgcnt = extras.getString("msgcnt");
		if (msgcnt != null) {
			mBuilder.setNumber(Integer.parseInt(msgcnt));
		}
		
		mNotificationManager.notify((String) appName, NOTIFICATION_ID, mBuilder.build());
	}
	
	public static void cancelNotification(Context context)
	{
		NotificationManager mNotificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
		mNotificationManager.cancel((String)getAppName(context), NOTIFICATION_ID);
	}
	
	private static String getAppName(Context context)
	{
		CharSequence appName = 
				context
					.getPackageManager()
					.getApplicationLabel(context.getApplicationInfo());
		
		return (String)appName;
	}
	
	@Override
	public void onError(Context context, String errorId) {
		Log.e(TAG, "onError - errorId: " + errorId);
	}
	



}
