var I18n = I18n || {};
I18n.translations = {"en":{"date":{"formats":{"default":"%Y-%m-%d","short":"%b %d","long":"%B %d, %Y"},"day_names":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"abbr_day_names":["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],"month_names":[null,"January","February","March","April","May","June","July","August","September","October","November","December"],"abbr_month_names":[null,"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"order":["year","month","day"],"month":"month","year":"year"},"time":{"formats":{"default":"%a, %d %b %Y %H:%M:%S %z","short":"%d %b %H:%M","long":"%B %d, %Y %H:%M"},"am":"am","pm":"pm"},"support":{"array":{"words_connector":", ","two_words_connector":" and ","last_word_connector":", and "}},"number":{"format":{"separator":".","delimiter":",","precision":3,"significant":false,"strip_insignificant_zeros":false},"currency":{"format":{"format":"%u%n","unit":"$","separator":".","delimiter":",","precision":2,"significant":false,"strip_insignificant_zeros":false}},"percentage":{"format":{"delimiter":"","format":"%n%"}},"precision":{"format":{"delimiter":""}},"human":{"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"kb":"KB","mb":"MB","gb":"GB","tb":"TB"}},"decimal_units":{"format":"%n %u","units":{"unit":"","thousand":"Thousand","million":"Million","billion":"Billion","trillion":"Trillion","quadrillion":"Quadrillion"}}}},"errors":{"format":"%{attribute} %{message}","messages":{"inclusion":"is not included in the list","exclusion":"is reserved","invalid":"is invalid","confirmation":"doesn't match %{attribute}","accepted":"must be accepted","empty":"can't be empty","blank":"can't be blank","present":"must be blank","too_long":"is too long (maximum is %{count} characters)","too_short":"is too short (minimum is %{count} characters)","wrong_length":"is the wrong length (should be %{count} characters)","not_a_number":"is not a number","not_an_integer":"must be an integer","greater_than":"must be greater than %{count}","greater_than_or_equal_to":"must be greater than or equal to %{count}","equal_to":"must be equal to %{count}","less_than":"must be less than %{count}","less_than_or_equal_to":"must be less than or equal to %{count}","other_than":"must be other than %{count}","odd":"must be odd","even":"must be even","taken":"has already been taken","carrierwave_processing_error":"failed to be processed","carrierwave_integrity_error":"is not of an allowed file type","carrierwave_download_error":"could not be downloaded","extension_white_list_error":"You are not allowed to upload %{extension} files, allowed types: %{allowed_types}","extension_black_list_error":"You are not allowed to upload %{extension} files, prohibited types: %{prohibited_types}","rmagick_processing_error":"Failed to manipulate with rmagick, maybe it is not an image? Original Error: %{e}","mime_types_processing_error":"Failed to process file with MIME::Types, maybe not valid content-type? Original Error: %{e}","mini_magick_processing_error":"Failed to manipulate with MiniMagick, maybe it is not an image? Original Error: %{e}","already_confirmed":"was already confirmed, please try signing in","confirmation_period_expired":"needs to be confirmed within %{period}, please request a new one","expired":"has expired, please request a new one","not_found":"not found","not_locked":"was not locked","not_saved":{"one":"1 error prohibited this %{resource} from being saved:","other":"%{count} errors prohibited this %{resource} from being saved:"}}},"activerecord":{"errors":{"messages":{"record_invalid":"Validation failed: %{errors}","restrict_dependent_destroy":{"one":"Cannot delete record because a dependent %{record} exists","many":"Cannot delete record because dependent %{record} exist"}}}},"datetime":{"distance_in_words":{"half_a_minute":"half a minute","less_than_x_seconds":{"one":"less than 1 second","other":"less than %{count} seconds"},"x_seconds":{"one":"1 second","other":"%{count} seconds"},"less_than_x_minutes":{"one":"less than a minute","other":"less than %{count} minutes"},"x_minutes":{"one":"1 minute","other":"%{count} minutes"},"about_x_hours":{"one":"about 1 hour","other":"about %{count} hours"},"x_days":{"one":"1 day","other":"%{count} days"},"about_x_months":{"one":"about 1 month","other":"about %{count} months"},"x_months":{"one":"1 month","other":"%{count} months"},"about_x_years":{"one":"about 1 year","other":"about %{count} years"},"over_x_years":{"one":"over 1 year","other":"over %{count} years"},"almost_x_years":{"one":"almost 1 year","other":"almost %{count} years"}},"prompts":{"year":"Year","month":"Month","day":"Day","hour":"Hour","minute":"Minute","second":"Seconds"}},"helpers":{"select":{"prompt":"Please select"},"submit":{"create":"Create %{model}","update":"Update %{model}","submit":"Save %{model}"},"page_entries_info":{"one_page":{"display_entries":{"zero":"No %{entry_name} found","one":"Displaying \u003Cb\u003E1\u003C/b\u003E %{entry_name}","other":"Displaying \u003Cb\u003Eall %{count}\u003C/b\u003E %{entry_name}"}},"more_pages":{"display_entries":"Displaying %{entry_name} \u003Cb\u003E%{first}\u0026nbsp;-\u0026nbsp;%{last}\u003C/b\u003E of \u003Cb\u003E%{total}\u003C/b\u003E in total"}},"actions":"Actions","links":{"back":"Back","cancel":"Cancel","confirm":"Are you sure?","destroy":"Delete","new":"New","edit":"Edit"},"titles":{"edit":"Edit %{model}","save":"Save %{model}","new":"New %{model}","delete":"Delete %{model}"}},"ransack":{"search":"search","predicate":"predicate","and":"and","or":"or","any":"any","all":"all","combinator":"combinator","attribute":"attribute","value":"value","condition":"condition","sort":"sort","asc":"ascending","desc":"descending","predicates":{"eq":"equals","eq_any":"equals any","eq_all":"equals all","not_eq":"not equal to","not_eq_any":"not equal to any","not_eq_all":"not equal to all","matches":"matches","matches_any":"matches any","matches_all":"matches all","does_not_match":"doesn't match","does_not_match_any":"doesn't match any","does_not_match_all":"doesn't match all","lt":"less than","lt_any":"less than any","lt_all":"less than all","lteq":"less than or equal to","lteq_any":"less than or equal to any","lteq_all":"less than or equal to all","gt":"greater than","gt_any":"greater than any","gt_all":"greater than all","gteq":"greater than or equal to","gteq_any":"greater than or equal to any","gteq_all":"greater than or equal to all","in":"in","in_any":"in any","in_all":"in all","not_in":"not in","not_in_any":"not in any","not_in_all":"not in all","cont":"contains","cont_any":"contains any","cont_all":"contains all","not_cont":"doesn't contain","not_cont_any":"doesn't contain any","not_cont_all":"doesn't contain all","start":"starts with","start_any":"starts with any","start_all":"starts with all","not_start":"doesn't start with","not_start_any":"doesn't start with any","not_start_all":"doesn't start with all","end":"ends with","end_any":"ends with any","end_all":"ends with all","not_end":"doesn't end with","not_end_any":"doesn't end with any","not_end_all":"doesn't end with all","true":"is true","false":"is false","present":"is present","blank":"is blank","null":"is null","not_null":"is not null"}},"flash":{"actions":{"create":{"notice":"%{resource_name} was successfully created."},"update":{"notice":"%{resource_name} was successfully updated."},"destroy":{"notice":"%{resource_name} was successfully destroyed.","alert":"%{resource_name} could not be destroyed."}}},"views":{"pagination":{"first":"\u0026laquo;","last":"\u0026raquo;","previous":"\u0026lsaquo;","next":"\u0026rsaquo;","truncate":"..."}},"devise":{"confirmations":{"confirmed":"Your account was successfully confirmed.","send_instructions":"You will receive an email with instructions about how to confirm your account in a few minutes.","send_paranoid_instructions":"If your email address exists in our database, you will receive an email with instructions about how to confirm your account in a few minutes."},"failure":{"already_authenticated":"You are already signed in.","inactive":"Your account is not activated yet.","invalid":"Invalid email or password.","locked":"Your account is locked.","last_attempt":"You have one more attempt before your account will be locked.","not_found_in_database":"Invalid email or password.","timeout":"Your session expired. Please sign in again to continue.","unauthenticated":"You need to sign in or sign up before continuing.","unconfirmed":"You have to confirm your account before continuing."},"mailer":{"confirmation_instructions":{"subject":"Confirmation instructions"},"reset_password_instructions":{"subject":"Reset password instructions"},"unlock_instructions":{"subject":"Unlock Instructions"}},"omniauth_callbacks":{"failure":"Could not authenticate you from %{kind} because \"%{reason}\".","success":"Successfully authenticated from %{kind} account."},"passwords":{"no_token":"You can't access this page without coming from a password reset email. If you do come from a password reset email, please make sure you used the full URL provided.","send_instructions":"You will receive an email with instructions about how to reset your password in a few minutes.","send_paranoid_instructions":"If your email address exists in our database, you will receive a password recovery link at your email address in a few minutes.","updated":"Your password was changed successfully. You are now signed in.","updated_not_active":"Your password was changed successfully."},"registrations":{"destroyed":"Bye! Your account was successfully cancelled. We hope to see you again soon.","signed_up":"Welcome! You have signed up successfully.","signed_up_but_inactive":"You have signed up successfully. However, we could not sign you in because your account is not yet activated.","signed_up_but_locked":"You have signed up successfully. However, we could not sign you in because your account is locked.","signed_up_but_unconfirmed":"A message with a confirmation link has been sent to your email address. Please open the link to activate your account.","update_needs_confirmation":"You updated your account successfully, but we need to verify your new email address. Please check your email and click on the confirm link to finalize confirming your new email address.","updated":"You updated your account successfully."},"sessions":{"signed_in":"Signed in successfully.","signed_out":"Signed out successfully."},"unlocks":{"send_instructions":"You will receive an email with instructions about how to unlock your account in a few minutes.","send_paranoid_instructions":"If your account exists, you will receive an email with instructions about how to unlock it in a few minutes.","unlocked":"Your account has been unlocked successfully. Please sign in to continue."}},"active_admin":{"dashboard":"Dashboard","dashboard_welcome":{"welcome":"Welcome to Active Admin. This is the default dashboard page.","call_to_action":"To add dashboard sections, checkout 'app/admin/dashboard.rb'"},"view":"View","edit":"Edit","delete":"Delete","delete_confirmation":"Are you sure you want to delete this?","new_model":"New %{model}","create_model":"New %{model}","edit_model":"Edit %{model}","update_model":"Edit %{model}","delete_model":"Delete %{model}","details":"%{model} Details","cancel":"Cancel","empty":"Empty","previous":"Previous","next":"Next","download":"Download:","has_many_new":"Add New %{model}","has_many_delete":"Delete","has_many_remove":"Remove","filters":{"buttons":{"filter":"Filter","clear":"Clear Filters"},"predicates":{"contains":"Contains","equals":"Equals","starts_with":"Starts with","ends_with":"Ends with","greater_than":"Greater than","less_than":"Less than"}},"main_content":"Please implement %{model}#main_content to display content.","logout":"Logout","powered_by":"Powered by %{active_admin} %{version}","sidebars":{"filters":"Filters"},"pagination":{"empty":"No %{model} found","one":"Displaying \u003Cb\u003E1\u003C/b\u003E %{model}","one_page":"Displaying \u003Cb\u003Eall %{n}\u003C/b\u003E %{model}","multiple":"Displaying %{model} \u003Cb\u003E%{from}\u0026nbsp;-\u0026nbsp;%{to}\u003C/b\u003E of \u003Cb\u003E%{total}\u003C/b\u003E in total","multiple_without_total":"Displaying %{model} \u003Cb\u003E%{from}\u0026nbsp;-\u0026nbsp;%{to}\u003C/b\u003E","entry":{"one":"entry","other":"entries"}},"any":"Any","blank_slate":{"content":"There are no %{resource_name} yet.","link":"Create one"},"batch_actions":{"button_label":"Batch Actions","default_confirmation":"Are you sure you want to do this?","delete_confirmation":"Are you sure you want to delete these %{plural_model}?","succesfully_destroyed":{"one":"Successfully destroyed 1 %{model}","other":"Successfully destroyed %{count} %{plural_model}"},"selection_toggle_explanation":"(Toggle Selection)","link":"Create one","action_label":"%{title} Selected","labels":{"destroy":"Delete"}},"comments":{"resource_type":"Resource Type","author_type":"Author Type","body":"Body","author":"Author","title":"Comment","add":"Add Comment","resource":"Resource","no_comments_yet":"No comments yet.","author_missing":"Anonymous","title_content":"Comments (%{count})","errors":{"empty_text":"Comment wasn't saved, text was empty."}},"devise":{"username":{"title":"Username"},"email":{"title":"Email"},"subdomain":{"title":"Subdomain"},"password":{"title":"Password"},"sign_up":{"title":"Sign up","submit":"Sign up"},"login":{"title":"Login","remember_me":"Remember me","submit":"Login"},"reset_password":{"title":"Forgot your password?","submit":"Reset My Password"},"change_password":{"title":"Change your password","submit":"Change my password"},"unlock":{"title":"Resend unlock instructions","submit":"Resend unlock instructions"},"resend_confirmation_instructions":{"title":"Resend confirmation instructions","submit":"Resend confirmation instructions"},"links":{"sign_in":"Sign in","forgot_your_password":"Forgot your password?","sign_in_with_omniauth_provider":"Sign in with %{provider}"}},"access_denied":{"message":"You are not authorized to perform this action."},"index_list":{"table":"Table","block":"List","grid":"Grid","blog":"Blog"}},"need_to_save":"need to save","are_you_sure?":"Are you sure?","what_is_it":"(What is it?)","your_shopping_cart_is_empty":"Your shopping cart is empty!!!","add":"add","cancel":"cancel","shop":"\u003C\u003C shop","back":"\u003C\u003C back","back_to_orders":"\u003C\u003C Back to orders","edit":"edit","view":"view","add_to_cart":"add to cart","empty_cart":"empty cart","go_to_cart":"go to cart","continue_shopping":"continue shopping","phone":"Phone","go_back_to_store":"GO BACK TO STORE","save":"SAVE","update":"update","subtotal":"SUBTOTAL","shipping":"SHIPPING","order_summary":"ORDER SUMMARY","item_total":"ITEM TOTAL","order_total":"ORDER TOTAL","billing_address":"BILLING ADDRESS","shipping_address":"SHIPPING ADDRESS","save_and_continue":"SAVE AND CONTINUE","show_by_categories":"SHOP BY CATEGORIES","anonym":"anonym","use_ship_address":"Use Bill Address","place_order":"PLACE ORDER","order":{"name":"Order","table":{"number":"NUMBER","completed_at":"COMPLETED AT","total":"TOTAL"},"state":{"in_progress":"IN PROGRESS","waiting":"WAITING","in_delivery":"IN DELIVERY","delivered":"DELIVERED"}},"shipments":"SHIPMENTS","payment_info":"PAYMENT INFORMATION","confirm":"CONFIRM","credit_card":{"name":"CREDIT CARD","expiration_date":"Expiration date:","card_code":"Card Code","card_number":"Card Number"},"address":{"firstname":"firstname","lastname":"lastname","street":"street","city":"city","phone":"phone","zipcode":"zipcode"},"checkout":{"name":"checkout","address":"ADDRESS","delivery":"DELIVERY","payment":"PAYMENT","confirm":"CONFIRM","complete":"COMPLETE"},"review":{"not_verify_by_admin_yet":"review is not verify by admin yet","add_review_for_book":"add review for %{title}","new_review_for":"New review for"},"book":{"reviews":"Reviews","table":{"book":"BOOK","price":"PRICE","qty":"QTY","total":"TOTAL"}},"hello":"Hello world","success":{"created":"%{obj} was successfully created","updated":"%{obj} was successfully updated","destroyed":"%{obj} was successfully destroyed"},"fail":{"created":"%{obj} wasn't created","updated":"%{obj} wasn't updated","destroyed":"%{obj} wasn't destroyed","error":"Ann error has occurred","empty_field":"Some field is empty!","saved":"%{obj} wasn't saved","fill_credit_cart_info":"Fill your credit card information!!!","set_addresses_payment_delivery":"Set addresses, payment and delivery!"}}};