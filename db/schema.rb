# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120302095955) do

  create_table "OrdersDetailsPurchase", :id => false, :force => true do |t|
    t.integer   "OrdersDetailsPurchase_id",                   :null => false
    t.integer   "OrdersPurchase_id",                          :null => false
    t.integer   "qty",                                        :null => false
    t.timestamp "date_added",                                 :null => false
    t.datetime  "last_modified"
    t.integer   "user_modified",                              :null => false
    t.boolean   "active",                   :default => true
  end

  add_index "OrdersDetailsPurchase", ["OrdersPurchase_id"], :name => "ordersPurchaseSale"

  create_table "OrdersPurchase", :id => false, :force => true do |t|
    t.integer   "OrdersPurchase_id",                                                                      :null => false
    t.integer   "products_id",                                                                            :null => false
    t.integer   "qty",                                                                                    :null => false
    t.decimal   "cost",                            :precision => 5, :scale => 2,                          :null => false
    t.string    "supplier",          :limit => 45,                                                        :null => false
    t.timestamp "date_added",                                                                             :null => false
    t.datetime  "last_modified",                                                                          :null => false
    t.integer   "user_modified",                                                                          :null => false
    t.boolean   "active",                                                        :default => true,        :null => false
    t.string    "status_order",      :limit => 0,                                :default => "MUSTORDER", :null => false
  end

  add_index "OrdersPurchase", ["products_id"], :name => "products_id"

  create_table "PrevisionAchat", :force => true do |t|
    t.timestamp "date_added",                                        :null => false
    t.datetime  "last_modified"
    t.integer   "user_modified",                                     :null => false
    t.integer   "products_id",                                       :null => false
    t.integer   "nb_dvdTheorique"
    t.integer   "nb_customershigh"
    t.integer   "nb_customersTotal"
    t.integer   "nb_dvdOK"
    t.integer   "nb_dvdBought"
    t.integer   "nb_dvdAchat"
    t.integer   "nb_dvdActuallyStock"
    t.datetime  "dateStart"
    t.integer   "OrdersMonthCurrent"
    t.integer   "Orders-1Month"
    t.integer   "Orders-2Month"
    t.integer   "Orders-3Month"
    t.integer   "Orders-4Month"
    t.integer   "Orders-5Month"
    t.integer   "Orders-6Month"
    t.decimal   "Rate-1Month",         :precision => 5, :scale => 3
    t.decimal   "Rate-2Month",         :precision => 5, :scale => 3
    t.decimal   "Rate-3Month",         :precision => 5, :scale => 3
    t.decimal   "Rate-4Month",         :precision => 5, :scale => 3
    t.decimal   "Rate-5Month",         :precision => 5, :scale => 3
    t.decimal   "Rate-6Month",         :precision => 5, :scale => 3
    t.decimal   "RateMonthCurrent",    :precision => 5, :scale => 3
  end

  create_table "RateRotationAbo", :id => false, :force => true do |t|
    t.integer   "abo_type",                                      :null => false
    t.decimal   "AverageRotation", :precision => 5, :scale => 2, :null => false
    t.timestamp "date_added",                                    :null => false
    t.integer   "id",                                            :null => false
  end

  create_table "abo", :primary_key => "abo_id", :force => true do |t|
    t.integer  "customerid",         :default => 0,       :null => false
    t.integer  "Action",             :default => 0,       :null => false
    t.integer  "code_id"
    t.datetime "Date",                                    :null => false
    t.integer  "product_id",         :default => 0,       :null => false
    t.string   "payment_method",     :default => "ogone", :null => false
    t.integer  "privilege_notified", :default => 0,       :null => false
    t.text     "comment",                                 :null => false
    t.integer  "site",               :default => 0,       :null => false
  end

  add_index "abo", ["Action", "customerid"], :name => "abo_cust_action"
  add_index "abo", ["Action"], :name => "action"
  add_index "abo", ["Date"], :name => "date"
  add_index "abo", ["customerid", "Date"], :name => "Cust_Date"
  add_index "abo", ["customerid"], :name => "Customerid"

  create_table "abo_action", :id => false, :force => true do |t|
    t.integer "id",                 :default => 0,  :null => false
    t.string  "name", :limit => 50, :default => "", :null => false
  end

  create_table "abo_days_added", :primary_key => "abo_days_added_id", :force => true do |t|
    t.integer  "customers_id", :default => 0,  :null => false
    t.datetime "date",                         :null => false
    t.integer  "nbrdays",      :default => 0,  :null => false
    t.integer  "login_id",     :default => 0,  :null => false
    t.string   "comment",      :default => "", :null => false
  end

  create_table "abo_history", :primary_key => "abo_history_id", :force => true do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer  "duration"
    t.integer  "duration_indays", :default => 0
    t.integer  "products_id"
    t.integer  "customers_id"
    t.integer  "dvd_sent"
    t.integer  "reconductions"
  end

  create_table "abo_history2", :primary_key => "abo_history_id", :force => true do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer  "creation_action_id"
    t.integer  "code_id"
    t.integer  "duration"
    t.integer  "duration_indays"
    t.integer  "customers_id"
    t.integer  "dvd_sent"
    t.integer  "reconductions"
  end

  add_index "abo_history2", ["customers_id"], :name => "customers_id"
  add_index "abo_history2", ["end"], :name => "end"
  add_index "abo_history2", ["start"], :name => "start"

  create_table "abo_history_details", :primary_key => "abo_history_details_id", :force => true do |t|
    t.integer  "abo_history_id"
    t.integer  "action_id"
    t.datetime "date_modified"
    t.integer  "new_products_id"
    t.integer  "old_products_id"
  end

  add_index "abo_history_details", ["abo_history_id"], :name => "abo_history_id"
  add_index "abo_history_details", ["action_id"], :name => "action_id"
  add_index "abo_history_details", ["date_modified"], :name => "date_modified"

  create_table "abo_schema", :id => false, :force => true do |t|
    t.integer "customers_id", :default => 0,  :null => false
    t.string  "schema",       :default => "", :null => false
  end

  create_table "abo_start_prolongation", :primary_key => "spector_reconduction_id", :force => true do |t|
    t.datetime "date",                        :null => false
    t.integer  "customers_id", :default => 0, :null => false
  end

  create_table "abo_stop_byphone_tracking", :primary_key => "abo_stop_byphone_tracking_id", :force => true do |t|
    t.integer  "customers_id", :default => 0, :null => false
    t.datetime "date",                        :null => false
    t.integer  "adminby",      :default => 0, :null => false
  end

  create_table "abo_stop_why", :primary_key => "abo_stop_why_id", :force => true do |t|
    t.integer  "customers_id", :default => 0, :null => false
    t.datetime "date",                        :null => false
    t.integer  "whystop1",     :default => 0, :null => false
    t.integer  "whystop2",     :default => 0, :null => false
    t.integer  "whystop3",     :default => 0, :null => false
    t.integer  "whystop4",     :default => 0, :null => false
    t.integer  "whystop5",     :default => 0, :null => false
    t.integer  "whystop6",     :default => 0, :null => false
    t.integer  "whystop7",     :default => 0, :null => false
    t.integer  "whystop8",     :default => 0, :null => false
    t.integer  "whystop9",     :default => 0, :null => false
    t.integer  "whystop10",    :default => 0, :null => false
    t.integer  "whystop11",    :default => 0, :null => false
    t.integer  "whystop12",    :default => 0, :null => false
    t.integer  "whystop13",    :default => 0, :null => false
    t.integer  "whystop14",    :default => 0, :null => false
    t.integer  "whystop15",    :default => 0, :null => false
    t.integer  "whystop16",    :default => 0, :null => false
    t.integer  "whystop17",    :default => 0, :null => false
    t.integer  "whystop18",    :default => 0, :null => false
    t.integer  "whystop19",    :default => 0, :null => false
    t.integer  "whystop20",    :default => 0, :null => false
    t.integer  "whystop21",    :default => 0, :null => false
    t.integer  "whystop22",    :default => 0, :null => false
    t.integer  "whystop23",    :default => 0, :null => false
    t.integer  "whystop24",    :default => 0, :null => false
    t.integer  "whystop25",    :default => 0, :null => false
    t.integer  "whystop26",    :default => 0, :null => false
    t.integer  "whystop27",    :default => 0, :null => false
    t.integer  "whystop28",    :default => 0, :null => false
    t.text     "whystopother",                :null => false
    t.integer  "youliked1",    :default => 0, :null => false
    t.integer  "youliked2",    :default => 0, :null => false
    t.integer  "youliked3",    :default => 0, :null => false
    t.integer  "youliked4",    :default => 0, :null => false
    t.integer  "youliked5",    :default => 0, :null => false
    t.integer  "youliked6",    :default => 0, :null => false
  end

  add_index "abo_stop_why", ["customers_id"], :name => "customers_id"

  create_table "abo_stop_why_explained", :id => false, :force => true do |t|
    t.string "whystop",   :default => "", :null => false
    t.string "explained", :default => "", :null => false
  end

  create_table "abo_stopped_with_dvdathome", :primary_key => "abo_stopped_with_dvdathome_id", :force => true do |t|
    t.integer  "status",                       :default => 0, :null => false
    t.datetime "last_modified",                               :null => false
    t.integer  "last_status_mail_opened",      :default => 0, :null => false
    t.datetime "last_status_mail_opened_date"
    t.integer  "bad_mail",                     :default => 0, :null => false
    t.integer  "customers_id",                 :default => 0, :null => false
    t.datetime "date_abo_stopped",                            :null => false
    t.integer  "abo_id",                       :default => 0, :null => false
    t.datetime "date_added"
    t.datetime "date_last_mail_sent",                         :null => false
    t.datetime "date_closed"
  end

  create_table "abo_stopped_with_dvdathome_products", :primary_key => "abo_stopped_with_dvdathome_products_id", :force => true do |t|
    t.integer  "abo_stopped_with_dvdathome_id", :default => 0, :null => false
    t.integer  "orders_id",                     :default => 0, :null => false
    t.integer  "products_id",                   :default => 0, :null => false
    t.integer  "dvd_id",                        :default => 0, :null => false
    t.datetime "date_purchased",                               :null => false
    t.integer  "abo_id",                        :default => 0, :null => false
    t.integer  "status"
  end

  create_table "abo_stopped_with_dvdathome_status", :id => false, :force => true do |t|
    t.integer "abo_stopped_with_dvdahome_status_id",   :default => 0,  :null => false
    t.string  "abo_stopped_with_dvdahome_status_name", :default => "", :null => false
  end

  create_table "abo_stopped_with_dvdathome_status_history", :primary_key => "abo_stopped_with_dvdathome_status_history_id", :force => true do |t|
    t.integer  "abo_stopped_with_dvdathome_id", :default => 0, :null => false
    t.integer  "abo_id",                        :default => 0, :null => false
    t.integer  "new_value",                     :default => 0, :null => false
    t.integer  "old_value"
    t.datetime "date_added",                                   :null => false
    t.integer  "customer_notified",             :default => 0
    t.integer  "mail_opened",                   :default => 0, :null => false
    t.datetime "mail_opened_date"
    t.integer  "bad_mail",                      :default => 0, :null => false
  end

  create_table "abo_suspended_action", :id => false, :force => true do |t|
    t.integer "abo_suspended_action_id",   :default => 0,  :null => false
    t.string  "abo_suspended_action_name", :default => "", :null => false
  end

  create_table "abo_suspended_history", :primary_key => "abo_suspended_id", :force => true do |t|
    t.integer  "customers_id", :default => 0,  :null => false
    t.datetime "date",                         :null => false
    t.integer  "action",       :default => 0,  :null => false
    t.integer  "reason",       :default => 0,  :null => false
    t.string   "comment",      :default => "", :null => false
  end

  create_table "abo_suspended_holiday", :primary_key => "abo_suspended_holiday_id", :force => true do |t|
    t.integer  "customers_id", :default => 0, :null => false
    t.datetime "date_asked",                  :null => false
    t.integer  "weeks",        :default => 0, :null => false
    t.datetime "date_end",                    :null => false
  end

  create_table "abo_suspended_reason", :id => false, :force => true do |t|
    t.integer "abo_suspended_reason_id",   :default => 0,  :null => false
    t.string  "abo_suspended_reason_name", :default => "", :null => false
  end

  create_table "aboprocess", :primary_key => "aboprocessid", :force => true do |t|
    t.integer  "customers_id",                  :default => 0, :null => false
    t.datetime "aboprocessdate",                               :null => false
    t.integer  "customers_abo_dvd_2send_norm",  :default => 0, :null => false
    t.integer  "customers_abo_dvd_2send_adult", :default => 0, :null => false
    t.integer  "dvd_still2send_norm",           :default => 0, :null => false
    t.integer  "dvd_still2send_adult",          :default => 0, :null => false
    t.integer  "aboprocess_wl2small_mail",      :default => 0, :null => false
    t.integer  "compensation",                  :default => 0, :null => false
    t.integer  "wishlist_norm_size"
    t.integer  "run_id"
    t.integer  "dvd_norm_sent"
    t.integer  "wishlist_adult_size"
    t.integer  "dvd_adult_sent"
    t.integer  "must_served"
  end

  add_index "aboprocess", ["aboprocessdate"], :name => "aboprocessdate"
  add_index "aboprocess", ["customers_id"], :name => "customers_id"

  create_table "aboprocess_consolidated", :primary_key => "aboprocess_consolidated_id", :force => true do |t|
    t.date    "day_run",                           :null => false
    t.integer "customers_id",       :default => 0, :null => false
    t.integer "wl_size_norm",       :default => 0
    t.integer "wl_size_adult",      :default => 0
    t.integer "tosend",             :default => 0
    t.integer "tosend_abo",         :default => 0
    t.integer "tosend_comp",        :default => 0
    t.integer "tosend_norm",        :default => 0
    t.integer "tosend_abo_norm",    :default => 0
    t.integer "tosend_comp_norm",   :default => 0
    t.integer "tosend_adult",       :default => 0
    t.integer "tosend_abo_adult",   :default => 0
    t.integer "tosend_comp_adult",  :default => 0
    t.integer "throttling",         :default => 0, :null => false
    t.integer "sent",               :default => 0
    t.integer "sent_abo",           :default => 0
    t.integer "sent_comp",          :default => 0
    t.integer "sent_norm",          :default => 0
    t.integer "sent_abo_norm",      :default => 0
    t.integer "sent_comp_norm",     :default => 0
    t.integer "sent_adult",         :default => 0
    t.integer "sent_abo_adult",     :default => 0
    t.integer "sent_comp_adult",    :default => 0
    t.integer "tosend_abo_max",     :default => 0
    t.integer "customers_abo_type", :default => 0
    t.integer "at_home_norm"
    t.integer "at_home_adult"
  end

  add_index "aboprocess_consolidated", ["customers_id"], :name => "customers_id"
  add_index "aboprocess_consolidated", ["day_run"], :name => "day"

  create_table "aboprocess_feesharing_slow_down_impact", :id => false, :force => true do |t|
    t.date    "date",                        :null => false
    t.integer "customers_id", :default => 0, :null => false
    t.integer "nbrdvd",       :default => 0, :null => false
  end

  create_table "aboprocess_stats", :primary_key => "aboprocess_id", :force => true do |t|
    t.integer  "total_customers"
    t.integer  "total_dvd_available"
    t.integer  "cust_served"
    t.integer  "cust_not_served"
    t.integer  "dvd_norm_to_send"
    t.integer  "dvd_adult_to_send"
    t.integer  "dvd_norm_compensation"
    t.integer  "dvd_adult_compensation"
    t.integer  "notserved_nocredit"
    t.integer  "notserved_nodvdfound"
    t.integer  "notserved_suspended"
    t.integer  "notserved_too_many_at_home"
    t.integer  "notserved_attributed_ranktoolow"
    t.datetime "date_start"
    t.datetime "date_end"
    t.decimal  "rate_dvd_served",                 :precision => 10, :scale => 0
    t.decimal  "rate_cust_served",                :precision => 10, :scale => 0
    t.decimal  "metrics_priority",                :precision => 5,  :scale => 2
    t.integer  "dvd_asked"
    t.integer  "dvd_sent"
    t.integer  "dvd_highsent"
    t.integer  "dvd_mediumsent"
    t.integer  "dvd_lowsent"
    t.integer  "wishlist_normempty"
    t.integer  "wishlist_normless20"
    t.integer  "wishlist_adultempty"
    t.integer  "wishlist_adultless20"
    t.integer  "cpterror"
    t.integer  "must_served"
  end

  create_table "aboprocess_stats_new", :id => false, :force => true do |t|
    t.integer  "aboprocess_id",                                                       :null => false
    t.integer  "products_type"
    t.integer  "total_customers"
    t.integer  "total_dvd_available"
    t.integer  "cust_must_served"
    t.integer  "cust_served"
    t.integer  "cust_partial_served"
    t.integer  "cust_notserved_total"
    t.integer  "cust_notserved_nomanaged"
    t.integer  "cust_notserved_nocredit"
    t.integer  "cust_notserved_nodvdfound"
    t.integer  "cust_notserved_suspended"
    t.integer  "cust_notserved_too_many_at_home"
    t.integer  "cust_notserved_attributed_ranktoolow"
    t.integer  "cust_notserved_error"
    t.integer  "dvd_to_send"
    t.integer  "dvd_compensation"
    t.datetime "date_start"
    t.datetime "date_end"
    t.decimal  "rate_cust_served",                     :precision => 10, :scale => 0
    t.decimal  "metrics_priority",                     :precision => 5,  :scale => 2
    t.integer  "dvd_asked"
    t.integer  "dvd_sent"
    t.integer  "dvd_highsent"
    t.integer  "dvd_mediumsent"
    t.integer  "dvd_lowsent"
    t.decimal  "rate_dvd_served",                      :precision => 10, :scale => 0
    t.integer  "wishlist_empty"
    t.integer  "wishlist_less20"
  end

  create_table "aboprocess_throttling", :id => false, :force => true do |t|
    t.date    "date",                      :null => false
    t.integer "abo_type",   :default => 0, :null => false
    t.integer "throttling", :default => 0, :null => false
  end

  create_table "aboprocess_throttling_history", :primary_key => "aboprocess_throttling_history_id", :force => true do |t|
    t.datetime "date",                        :null => false
    t.integer  "customers_id", :default => 0, :null => false
    t.integer  "throttling",   :default => 0, :null => false
  end

  create_table "aboprocess_throttling_immunisation", :primary_key => "aboprocess_throttling_immunisation_id", :force => true do |t|
    t.integer  "customers_id",            :default => 0, :null => false
    t.datetime "date_asked",                             :null => false
    t.integer  "has_been_immunised",      :default => 0, :null => false
    t.datetime "has_been_immunised_date"
  end

  add_index "aboprocess_throttling_immunisation", ["customers_id"], :name => "customers_id"

  create_table "aboprocess_throttling_mail", :primary_key => "aboprocess_throttling_mail_id", :force => true do |t|
    t.datetime "date",                        :null => false
    t.integer  "customers_id", :default => 0, :null => false
  end

  create_table "aboprocess_timings", :primary_key => "aboprocess_timings_id", :force => true do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer  "crashed"
    t.integer  "run_id"
  end

  create_table "account_revenue_cleaned", :primary_key => "account_revenue_cleaned_id", :force => true do |t|
    t.string  "account_number",                                 :default => "",  :null => false
    t.integer "mouvement_id",                                   :default => 0,   :null => false
    t.string  "date_account",                                   :default => "",  :null => false
    t.string  "date_value",                                     :default => "",  :null => false
    t.decimal "amount",           :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.string  "account_currency",                               :default => "",  :null => false
    t.string  "amount_bef",                                     :default => "",  :null => false
    t.string  "bef",                                            :default => "",  :null => false
    t.string  "rubrique",                                       :default => "",  :null => false
    t.text    "libelle",                                                         :null => false
    t.text    "detail",                                                          :null => false
    t.string  "rem",                                            :default => "",  :null => false
    t.string  "budget_date",                                    :default => "",  :null => false
    t.string  "category",                                       :default => "",  :null => false
    t.integer "customers_id"
  end

  create_table "account_revenue_raw", :id => false, :force => true do |t|
    t.string  "account_number",                 :default => "", :null => false
    t.integer "mouvement_id",                   :default => 0,  :null => false
    t.string  "date_account",                   :default => "", :null => false
    t.string  "date_value",                     :default => "", :null => false
    t.string  "amount",                         :default => "", :null => false
    t.string  "account_currency",               :default => "", :null => false
    t.string  "amount_bef",                     :default => "", :null => false
    t.string  "bef",                            :default => "", :null => false
    t.string  "rubrique",                       :default => "", :null => false
    t.text    "libelle",                                        :null => false
    t.text    "detail",                                         :null => false
    t.string  "rem",                            :default => "", :null => false
    t.string  "budget_date",                    :default => "", :null => false
    t.string  "ced",              :limit => 10, :default => "", :null => false
  end

  create_table "actions_key", :force => true do |t|
    t.integer  "customers_id",               :null => false
    t.string   "key",          :limit => 50, :null => false
    t.integer  "actions_id",                 :null => false
    t.datetime "expired"
    t.integer  "ref_id"
  end

  create_table "actions_value", :force => true do |t|
    t.string "class",     :limit => 50
    t.string "comment",   :limit => 50
    t.string "multi_use", :limit => 0,  :default => "NO"
  end

  create_table "activation_campaign", :force => true do |t|
    t.string   "campaign_name",                   :limit => 50
    t.integer  "activation_group",                                                :null => false
    t.integer  "activation_pack",                                                 :null => false
    t.datetime "activation_code_creation_date",                                   :null => false
    t.datetime "activation_code_validto_date",                                    :null => false
    t.integer  "activation_products_id",                                          :null => false
    t.integer  "validity_month",                                                  :null => false
    t.integer  "validity_type",                                                   :null => false
    t.integer  "validity_value",                                                  :null => false
    t.integer  "activation_waranty",                                              :null => false
    t.string   "comment",                         :limit => 50
    t.integer  "abo_dvd_credit",                                                  :null => false
    t.integer  "next_discount",                                                   :null => false
    t.integer  "credit0_auto_reconduct",                                          :null => false
    t.integer  "abo_auto_stop_next_reconduction",                                 :null => false
    t.string   "activation_text_fr",              :limit => 50
    t.string   "activation_text_nl",              :limit => 50
    t.string   "activation_text_en",              :limit => 50
    t.string   "footer",                          :limit => 50
    t.string   "banner",                          :limit => 50
    t.integer  "droselia",                                                        :null => false
    t.string   "combined_action",                 :limit => 0,  :default => "NO"
  end

  create_table "activation_code", :primary_key => "activation_id", :force => true do |t|
    t.string   "activation_code",                 :limit => 50, :default => "",          :null => false
    t.integer  "activation_group",                              :default => 0,           :null => false
    t.integer  "campaign_id",                                                            :null => false
    t.integer  "activation_group_id",                           :default => 0,           :null => false
    t.integer  "activation_pack",                               :default => 0,           :null => false
    t.datetime "activation_code_creation_date"
    t.datetime "activation_code_validto_date"
    t.integer  "activation_products_id",                        :default => 0,           :null => false
    t.integer  "validity_month",                                :default => 0,           :null => false
    t.integer  "validity_type",                                 :default => 2,           :null => false
    t.integer  "validity_value",                                :default => 1,           :null => false
    t.integer  "activation_waranty",                            :default => 0,           :null => false
    t.integer  "customers_id",                                  :default => 0
    t.datetime "activation_date"
    t.string   "comment",                         :limit => 50, :default => "",          :null => false
    t.integer  "abo_dvd_credit",                                :default => 0,           :null => false
    t.integer  "next_discount",                                 :default => 0,           :null => false
    t.integer  "credit0_auto_reconduct",                        :default => 0,           :null => false
    t.integer  "abo_auto_stop_next_reconduction",               :default => 0,           :null => false
    t.string   "banner",                          :limit => 45, :default => "4dvd.gif",  :null => false
    t.string   "activation_text_fr",              :limit => 70, :default => "",          :null => false
    t.string   "activation_text_nl",              :limit => 70, :default => "",          :null => false
    t.string   "activation_text_en",              :limit => 70, :default => "",          :null => false
    t.integer  "free_upgrade_allowed",                          :default => 0,           :null => false
    t.string   "footer",                          :limit => 50, :default => "FREETRIAL", :null => false
    t.string   "campaign",                        :limit => 60,                          :null => false
    t.string   "combined_action",                 :limit => 0,  :default => "NO"
    t.integer  "next_abo_type"
    t.integer  "abo_dvd_remain",                                :default => 0
  end

  add_index "activation_code", ["activation_code"], :name => "activation_code", :unique => true
  add_index "activation_code", ["activation_group", "activation_code"], :name => "Indx_Group_Code"
  add_index "activation_code", ["activation_group"], :name => "activation_group"
  add_index "activation_code", ["activation_group_id"], :name => "activation_group_id"
  add_index "activation_code", ["customers_id"], :name => "customers_id"

  create_table "activation_code_actions", :force => true do |t|
    t.integer  "activation_code_id", :null => false
    t.integer  "class_id",           :null => false
    t.datetime "expired"
  end

  create_table "activation_code_class", :force => true do |t|
    t.string "class",       :limit => 50
    t.string "description", :limit => 50
  end

  create_table "activation_code_errors", :force => true do |t|
    t.integer  "activation_code_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "father_id"
    t.integer  "linked",             :default => 0, :null => false
  end

  create_table "activation_code_properties", :force => true do |t|
    t.integer "activation_code_actions_id",               :null => false
    t.string  "key",                        :limit => 50
    t.integer "value",                                    :null => false
  end

  create_table "activation_code_validity_type", :id => false, :force => true do |t|
    t.integer "id",   :default => 0,  :null => false
    t.string  "name", :default => "", :null => false
  end

  create_table "activation_gift", :primary_key => "activation_gift_id", :force => true do |t|
    t.datetime "date",                                :null => false
    t.integer  "customers_id",        :default => 0,  :null => false
    t.integer  "products_id",         :default => 0,  :null => false
    t.integer  "duration",            :default => 0,  :null => false
    t.integer  "quantity",            :default => 0,  :null => false
    t.integer  "gifttype",            :default => 0,  :null => false
    t.string   "firstname",           :default => "", :null => false
    t.string   "lastname",            :default => "", :null => false
    t.text     "message",                             :null => false
    t.string   "activation_code",     :default => "", :null => false
    t.integer  "coupon_template",     :default => 0,  :null => false
    t.integer  "gift_pack",           :default => 0,  :null => false
    t.datetime "gift_pack_sent_date"
  end

  create_table "activation_group", :primary_key => "activation_group_id", :force => true do |t|
    t.string "activation_group_name",               :default => "",          :null => false
    t.string "included_partner_file"
    t.string "banner",                :limit => 40, :default => "",          :null => false
    t.string "Footer",                :limit => 25, :default => "FREETRIAL", :null => false
  end

  create_table "activation_happydays", :primary_key => "activation_happydays_id", :force => true do |t|
    t.integer  "SenderRequestId",                   :default => 0,  :null => false
    t.datetime "hd_date",                                           :null => false
    t.string   "VoucherCode",         :limit => 15, :default => "", :null => false
    t.string   "CatalogCode",         :limit => 29, :default => "", :null => false
    t.integer  "Qty",                               :default => 0,  :null => false
    t.string   "LastName",            :limit => 50, :default => "", :null => false
    t.string   "FirstName",           :limit => 50, :default => "", :null => false
    t.string   "LangId",              :limit => 2,  :default => "", :null => false
    t.string   "Title",               :limit => 15, :default => "", :null => false
    t.string   "Adress1",             :limit => 30, :default => "", :null => false
    t.string   "Adress2",             :limit => 5,  :default => "", :null => false
    t.string   "Adress3",             :limit => 5,  :default => "", :null => false
    t.string   "Postcode",            :limit => 10, :default => "", :null => false
    t.string   "Town",                :limit => 30, :default => "", :null => false
    t.string   "Country",             :limit => 3,  :default => "", :null => false
    t.integer  "CardNo",              :limit => 8,  :default => 0,  :null => false
    t.string   "Email",               :limit => 50, :default => "", :null => false
    t.string   "FlgRollBack",         :limit => 1,  :default => "", :null => false
    t.integer  "OrigSenderRequestId",               :default => 0,  :null => false
  end

  add_index "activation_happydays", ["VoucherCode"], :name => "VoucherCode"

  create_table "activation_validity_type", :id => false, :force => true do |t|
    t.integer "validity_type_id",        :default => 0,  :null => false
    t.string  "validity_type_explained", :default => "", :null => false
  end

  create_table "actors", :primary_key => "actors_id", :force => true do |t|
    t.string  "actors_name",        :limit => 50, :default => "",           :null => false
    t.string  "actors_image",       :limit => 50, :default => "actors/"
    t.string  "actors_dateofbirth", :limit => 10, :default => "0000-00-00"
    t.text    "actors_description"
    t.text    "actors_awards"
    t.integer "top_actors",                       :default => 0
    t.string  "actors_type",        :limit => 10, :default => "",           :null => false
    t.string  "cached_slug"
    t.boolean "image_active",                     :default => false
    t.boolean "focus",                            :default => false,        :null => false
    t.string  "sexuality",          :limit => 0,  :default => "hetero",     :null => false
  end

  add_index "actors", ["actors_type"], :name => "actors_type"
  add_index "actors", ["cached_slug"], :name => "index_actors_on_cached_slug", :unique => true

  create_table "additional_card", :force => true do |t|
    t.integer  "customers_id",                                      :null => false
    t.string   "campaign",     :limit => 45, :default => "gfc2010", :null => false
    t.integer  "number",                                            :null => false
    t.string   "status",       :limit => 0,                         :null => false
    t.datetime "create_at"
    t.datetime "modify_at"
  end

  create_table "address_book", :id => false, :force => true do |t|
    t.integer   "customers_id",                       :default => 0,  :null => false
    t.integer   "address_book_id",                    :default => 1,  :null => false
    t.string    "entry_gender",         :limit => 1,  :default => "", :null => false
    t.string    "entry_company",        :limit => 32
    t.string    "entry_firstname",      :limit => 32, :default => ""
    t.string    "entry_lastname",       :limit => 32, :default => "", :null => false
    t.string    "entry_street_address", :limit => 64, :default => "", :null => false
    t.string    "entry_suburb",         :limit => 32
    t.string    "entry_postcode",       :limit => 10,                 :null => false
    t.string    "entry_city",           :limit => 32, :default => "", :null => false
    t.string    "entry_state",          :limit => 32
    t.integer   "entry_country_id",                   :default => 0,  :null => false
    t.integer   "entry_zone_id",                      :default => 0,  :null => false
    t.timestamp "date_added",                                         :null => false
  end

  add_index "address_book", ["customers_id"], :name => "customers_id"
  add_index "address_book", ["entry_postcode"], :name => "entry_postcode"
  add_index "address_book", ["entry_street_address"], :name => "entry_street_address"

  create_table "address_format", :primary_key => "address_format_id", :force => true do |t|
    t.string "address_format",  :limit => 128, :default => "", :null => false
    t.string "address_summary", :limit => 48,  :default => "", :null => false
  end

  create_table "automatic_emails", :force => true do |t|
    t.string   "name",                :limit => 50,                       :null => false
    t.datetime "create_date",                                             :null => false
    t.integer  "mail_id",                           :default => 0,        :null => false
    t.integer  "exe_time",                          :default => 0,        :null => false
    t.string   "script_name",         :limit => 50,                       :null => false
    t.integer  "count_mail",                        :default => 0,        :null => false
    t.string   "status",              :limit => 0,  :default => "ACTIVE"
    t.date     "date_last_execution",                                     :null => false
    t.integer  "frequency_days",                                          :null => false
  end

  create_table "automatic_emails_history", :force => true do |t|
    t.integer "mail_messages_id", :null => false
    t.integer "class_id"
  end

  create_table "bad_mail2", :primary_key => "bad_mail2_id", :force => true do |t|
    t.string  "email",        :default => "0", :null => false
    t.integer "reason",       :default => 0,   :null => false
    t.date    "date_sent",                     :null => false
    t.integer "emails_id",    :default => 0,   :null => false
    t.integer "customers_id", :default => 0,   :null => false
  end

  add_index "bad_mail2", ["customers_id"], :name => "customers_id"
  add_index "bad_mail2", ["emails_id"], :name => "emails_id"

  create_table "bad_mail2_reason", :primary_key => "reason_id", :force => true do |t|
    t.string "reason", :default => "0", :null => false
  end

  create_table "bank_account_movements", :primary_key => "account_movements_id", :force => true do |t|
    t.string    "coda_filename",                   :limit => 100
    t.date      "date_coda_created"
    t.string    "ReferenceNumberGivenByBank",      :limit => 13
    t.string    "BankReferenceNumberExtension",    :limit => 8
    t.boolean   "Debit"
    t.decimal   "Amount",                                         :precision => 12, :scale => 3
    t.date      "ValueDate"
    t.string    "OperationCode",                   :limit => 8
    t.string    "CommunicationTypeID",             :limit => 1
    t.string    "Communication",                   :limit => 53
    t.date      "AccountingDate"
    t.string    "BankingExtractSequenceNumber",    :limit => 3
    t.string    "GlobalisationCode",               :limit => 1
    t.string    "Communication2",                  :limit => 53
    t.string    "ClientReference",                 :limit => 26
    t.string    "InitialCurrency",                 :limit => 3
    t.decimal   "IntitialAmount",                                 :precision => 12, :scale => 3
    t.string    "BankAccountCounterpart",          :limit => 12
    t.string    "InternalCodeCounterpart",         :limit => 10
    t.string    "BankAccountCounterpartExtension", :limit => 15
    t.string    "CounterpartDetails",              :limit => 78
    t.string    "CounterpartName",                 :limit => 26
    t.string    "CounterpartAddress",              :limit => 26
    t.string    "CounterpartCity",                 :limit => 26
    t.string    "dvdpost_bank_account",            :limit => 12
    t.string    "communication_type",              :limit => 3
    t.string    "structuredComm12",                :limit => 12
    t.timestamp "date_added",                                                                                   :null => false
    t.integer   "ismatching",                                                                    :default => 0, :null => false
    t.datetime  "last_modified"
    t.integer   "user_modified"
    t.text      "EntireData"
    t.text      "comment"
    t.integer   "customers_id"
  end

  add_index "bank_account_movements", ["Amount"], :name => "amount"
  add_index "bank_account_movements", ["Communication"], :name => "communication"
  add_index "bank_account_movements", ["Debit", "ismatching"], :name => "debitmatching"
  add_index "bank_account_movements", ["Debit"], :name => "debit"
  add_index "bank_account_movements", ["date_coda_created"], :name => "date_coda"
  add_index "bank_account_movements", ["ismatching"], :name => "matching"
  add_index "bank_account_movements", ["structuredComm12"], :name => "ind_communication"

  create_table "bank_account_movements_categories", :primary_key => "categories_id", :force => true do |t|
    t.string  "categories_name",  :default => "", :null => false
    t.integer "categories_debit", :default => 0,  :null => false
  end

  create_table "bank_account_movements_hb", :primary_key => "bank_account_movements_hb_id", :force => true do |t|
    t.string  "Account",                      :limit => 12
    t.string  "BankReferenceNumberExtension", :limit => 8
    t.date    "date_accounting"
    t.date    "ValueDate"
    t.decimal "amount",                                     :precision => 12, :scale => 3
    t.string  "currency",                     :limit => 3
    t.decimal "amount_other",                               :precision => 12, :scale => 3
    t.string  "currency_other",               :limit => 3
    t.string  "Rubriques",                    :limit => 64
    t.text    "Libelles"
    t.text    "Details"
    t.string  "Remarks",                      :limit => 64
    t.date    "date_pivot"
    t.string  "revenue_cost",                 :limit => 2,                                 :default => "", :null => false
    t.integer "categories_id",                                                             :default => 0,  :null => false
    t.integer "customers_id"
    t.integer "unpaid_past_id"
  end

  add_index "bank_account_movements_hb", ["customers_id"], :name => "customers_id"

  create_table "bank_account_movements_to_categories", :id => false, :force => true do |t|
    t.integer "account_movements_id", :default => 0, :null => false
    t.integer "categories_id",        :default => 0, :null => false
  end

  add_index "bank_account_movements_to_categories", ["account_movements_id"], :name => "account_movements_id"

  create_table "bank_transfert", :force => true do |t|
    t.float     "amount",                                                                                     :null => false
    t.integer   "structure_communication", :limit => 8,                                                       :null => false
    t.datetime  "add_date",                                                                                   :null => false
    t.integer   "customers_id",                                                                               :null => false
    t.string    "status",                  :limit => 0,                                :default => "PENDING"
    t.timestamp "date_added",                                                                                 :null => false
    t.datetime  "last_modified"
    t.integer   "user_modified",                                                                              :null => false
    t.decimal   "amount_received",                      :precision => 10, :scale => 2, :default => 0.0
    t.integer   "account_movements_id"
    t.integer   "payment_method"
    t.decimal   "amount_remaining",                     :precision => 10, :scale => 2
    t.integer   "payment_status",                                                      :default => 1,         :null => false
  end

  add_index "bank_transfert", ["structure_communication"], :name => "ind_communication"

  create_table "banks", :force => true do |t|
    t.integer "b_from",                    :null => false
    t.integer "b_to",                      :null => false
    t.string  "biccode",     :limit => 25, :null => false
    t.integer "financialId"
    t.string  "namedutch",   :limit => 25, :null => false
    t.string  "namefrench",  :limit => 25, :null => false
    t.string  "namegerman",  :limit => 25, :null => false
    t.string  "nameenglish", :limit => 25, :null => false
  end

  create_table "banners", :primary_key => "banners_id", :force => true do |t|
    t.string   "banners_title",       :limit => 64, :default => "", :null => false
    t.string   "banners_url",         :limit => 64, :default => "", :null => false
    t.string   "banners_image",       :limit => 64, :default => "", :null => false
    t.string   "banners_group",       :limit => 10, :default => "", :null => false
    t.text     "banners_html_text"
    t.integer  "expires_impressions",               :default => 0
    t.datetime "expires_date"
    t.datetime "date_scheduled"
    t.datetime "date_added",                                        :null => false
    t.datetime "date_status_change"
    t.integer  "status",                            :default => 1,  :null => false
    t.integer  "active_nl",                         :default => 0,  :null => false
    t.integer  "active_en",                         :default => 0,  :null => false
  end

  create_table "banners_history", :primary_key => "banners_history_id", :force => true do |t|
    t.integer  "banners_id",           :default => 0, :null => false
    t.integer  "banners_shown",        :default => 0, :null => false
    t.integer  "banners_clicked",      :default => 0, :null => false
    t.datetime "banners_history_date",                :null => false
  end

  create_table "beta_tests", :force => true do |t|
    t.integer "customer_id"
  end

  add_index "beta_tests", ["customer_id"], :name => "Index_customersUnique", :unique => true

  create_table "black_list", :primary_key => "black_list_id", :force => true do |t|
    t.integer  "action",       :default => 0, :null => false
    t.integer  "customers_id", :default => 0, :null => false
    t.integer  "login_id",     :default => 0, :null => false
    t.datetime "date",                        :null => false
    t.text     "comment",                     :null => false
  end

  create_table "bo_leftmenu_links", :primary_key => "bo_leftmenu_links_id", :force => true do |t|
    t.string "text", :default => "", :null => false
    t.string "href", :default => "", :null => false
  end

  create_table "bo_leftmenu_links_to_loginid", :primary_key => "bo_leftmenu_links_to_loginid", :force => true do |t|
    t.integer "login_id",             :default => 0, :null => false
    t.integer "bo_leftmenu_links_id", :default => 0, :null => false
    t.integer "sort_order",           :default => 0, :null => false
  end

  create_table "bo_stat", :primary_key => "bo_stat_id", :force => true do |t|
    t.integer  "login_id",      :default => 0,  :null => false
    t.datetime "date",                          :null => false
    t.string   "path_info",     :default => "", :null => false
    t.string   "query_strings", :default => "", :null => false
  end

  add_index "bo_stat", ["date"], :name => "date"
  add_index "bo_stat", ["login_id"], :name => "login_id"

  create_table "cable_orders", :force => true do |t|
    t.integer  "customer_id"
    t.string   "name"
    t.boolean  "sent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cable_orders", ["customer_id"], :name => "index_cable_orders_on_customer_id"

  create_table "call_contacts", :force => true do |t|
    t.string "text", :limit => 45, :null => false
  end

  create_table "call_details_histories", :id => false, :force => true do |t|
    t.integer "call_history_id", :null => false
    t.integer "call_id",         :null => false
  end

  create_table "call_histories", :force => true do |t|
    t.integer  "customers_id",                   :null => false
    t.boolean  "FT",                             :null => false
    t.integer  "user_id",                        :null => false
    t.integer  "nb_reconduction",                :null => false
    t.integer  "contact_id",                     :null => false
    t.string   "comment",         :limit => 145, :null => false
    t.datetime "start_date",                     :null => false
    t.datetime "end_date",                       :null => false
  end

  create_table "calls", :force => true do |t|
    t.string "text", :limit => 45, :null => false
  end

  create_table "calls_hierarchy", :id => false, :force => true do |t|
    t.integer "id",                       :null => false
    t.integer "parent_id", :default => 0, :null => false
  end

  create_table "categories", :primary_key => "categories_id", :force => true do |t|
    t.string   "categories_image", :limit => 64
    t.integer  "parent_id",                      :default => 0,       :null => false
    t.integer  "sort_order"
    t.datetime "date_added"
    t.datetime "last_modified"
    t.string   "categories_type",  :limit => 10, :default => "",      :null => false
    t.string   "product_type",     :limit => 45, :default => "Movie"
    t.string   "active",           :limit => 0,  :default => "YES"
    t.string   "show_home",        :limit => 0,  :default => "YES"
    t.integer  "display_group",    :limit => 1
    t.integer  "size",                           :default => 0,       :null => false
    t.boolean  "vod",                            :default => false
  end

  add_index "categories", ["categories_type", "product_type"], :name => "idx_cat_Prod_type"
  add_index "categories", ["categories_type"], :name => "idx_categories_type"
  add_index "categories", ["parent_id"], :name => "idx_categories_parent_id"

  create_table "categories_description", :id => false, :force => true do |t|
    t.integer "categories_id",                 :default => 0,  :null => false
    t.integer "language_id",                   :default => 1,  :null => false
    t.string  "categories_name", :limit => 64, :default => "", :null => false
  end

  add_index "categories_description", ["categories_id", "language_id"], :name => "categories_id"
  add_index "categories_description", ["categories_name"], :name => "idx_categories_name"

  create_table "category_tickets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "web_available", :default => false
  end

  create_table "cc_expiration_status", :id => false, :force => true do |t|
    t.integer "cc_expiration_status_id",   :default => 0,  :null => false
    t.integer "language_id",               :default => 1,  :null => false
    t.string  "cc_expiration_status_name", :default => "", :null => false
  end

  add_index "cc_expiration_status", ["cc_expiration_status_name"], :name => "idx_orders_status_name"

  create_table "cc_expiration_status_history", :primary_key => "cc_expiration_status_history_status_history_id", :force => true do |t|
    t.integer  "customers_id",      :default => 0, :null => false
    t.integer  "new_value",         :default => 0, :null => false
    t.integer  "old_value"
    t.datetime "date_added",                       :null => false
    t.integer  "customer_notified", :default => 0
  end

  create_table "cc_update", :primary_key => "cc_update_id", :force => true do |t|
    t.integer  "customers_id",               :default => 0,  :null => false
    t.datetime "date",                                       :null => false
    t.string   "ccnum",        :limit => 50, :default => "", :null => false
    t.string   "ccexpdate",    :limit => 50, :default => "", :null => false
    t.string   "ccowner",                    :default => "", :null => false
    t.integer  "cc_status",                  :default => 0,  :null => false
  end

  create_table "chronicle_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "chronicle_contents", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "description"
    t.text     "full_description"
    t.integer  "chronicle_id"
    t.integer  "language_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "chronicle_contents", ["chronicle_id"], :name => "index_chronicle_contents_on_chronicle_id"

  create_table "chronicles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "deleted",     :default => false, :null => false
    t.integer  "category_id"
  end

  create_table "cinebel", :primary_key => "Code_film", :force => true do |t|
    t.string   "titre_libre",      :limit => 85
    t.string   "titre_gb",         :limit => 85
    t.string   "titre_fr",         :limit => 85
    t.string   "titre_nl",         :limit => 85
    t.string   "acteurs",          :limit => 130
    t.string   "acteur1",          :limit => 50
    t.string   "acteur2",          :limit => 50
    t.datetime "Date_de_sortie"
    t.string   "Metteur_en_scene", :limit => 50
    t.string   "realisateur",      :limit => 70
    t.string   "distributeur",     :limit => 50
    t.string   "style",            :limit => 50
    t.string   "acteur3",          :limit => 50
    t.string   "acteur4",          :limit => 100
    t.string   "pic1",             :limit => 10
    t.string   "complet",          :limit => 1
    t.text     "resume_fr",        :limit => 2147483647
    t.string   "pic2",             :limit => 10
    t.text     "promo_fr",         :limit => 2147483647
    t.string   "promof",           :limit => 1
    t.string   "origine",          :limit => 50
    t.string   "duree",            :limit => 50
    t.text     "resume_gb",        :limit => 2147483647
    t.text     "resume_nl",        :limit => 2147483647
    t.string   "YN",               :limit => 1
    t.string   "cino",             :limit => 12
    t.datetime "lastmod"
    t.string   "level",            :limit => 5
    t.string   "titre_full",       :limit => 85
    t.string   "titre_gr",         :limit => 10
    t.string   "stylenl",          :limit => 50
    t.string   "pic3",             :limit => 10
    t.string   "pic4",             :limit => 10
    t.string   "rl",               :limit => 1
    t.string   "rm",               :limit => 1
    t.string   "rh",               :limit => 1
    t.string   "kids",             :limit => 5
    t.string   "internet",         :limit => 100
    t.string   "ntit",             :limit => 85
    t.string   "wl",               :limit => 1
    t.string   "wm",               :limit => 1
    t.string   "wh",               :limit => 1
    t.datetime "date_vision"
    t.string   "lieu_vision",      :limit => 20
    t.string   "heure_vision",     :limit => 20
    t.string   "cd",               :limit => 50
    t.string   "rating_lu",        :limit => 5
    t.string   "rating_fr",        :limit => 5
    t.string   "acteur5",          :limit => 100
    t.string   "acteur6",          :limit => 100
    t.string   "acteur7",          :limit => 100
    t.string   "orig",             :limit => 50
    t.string   "annee",            :limit => 50
    t.string   "style1",           :limit => 50
    t.string   "style2",           :limit => 50
    t.string   "style3",           :limit => 50
    t.text     "ResFrCourt",       :limit => 2147483647
    t.text     "ResNlCourt",       :limit => 2147483647
    t.string   "realisateur2",     :limit => 50
    t.string   "mo1fr",            :limit => 50
    t.string   "mo2fr",            :limit => 50
    t.string   "mo3fr",            :limit => 50
    t.string   "mo4fr",            :limit => 50
    t.string   "mo1nl",            :limit => 50
    t.datetime "updatevideo"
    t.string   "mo2nl",            :limit => 50
    t.string   "mo3nl",            :limit => 50
    t.string   "awardfr",          :limit => 50
    t.string   "awardnl",          :limit => 50
    t.string   "mo4nl",            :limit => 50
    t.string   "coeur",            :limit => 50
    t.string   "style1nl",         :limit => 50
    t.string   "style2nl",         :limit => 50
    t.string   "style3nl",         :limit => 50
    t.string   "ean",              :limit => 20
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "compensation", :primary_key => "compensation_id", :force => true do |t|
    t.integer  "customers_id",              :default => 0, :null => false
    t.datetime "compensation_date_given",                  :null => false
    t.datetime "compensation_date_setback"
    t.text     "compensation_comment"
    t.integer  "orders_id",                 :default => 0, :null => false
    t.integer  "products_id"
    t.integer  "products_dvdid",            :default => 0, :null => false
    t.integer  "products_id_given"
    t.integer  "products_dvdid_given"
    t.integer  "orders_id_given"
  end

  add_index "compensation", ["customers_id"], :name => "customers_id"
  add_index "compensation", ["orders_id"], :name => "orders_id"
  add_index "compensation", ["orders_id_given"], :name => "orders_id_given"

  create_table "configuration", :primary_key => "configuration_id", :force => true do |t|
    t.string   "configuration_title",       :limit => 64, :default => "", :null => false
    t.string   "configuration_key",         :limit => 64, :default => "", :null => false
    t.string   "configuration_value",                     :default => "", :null => false
    t.string   "configuration_description",               :default => "", :null => false
    t.integer  "configuration_group_id",                  :default => 0,  :null => false
    t.integer  "sort_order"
    t.datetime "last_modified"
    t.datetime "date_added",                                              :null => false
    t.string   "use_function"
    t.string   "set_function"
  end

  create_table "contest", :primary_key => "contest_id", :force => true do |t|
    t.datetime "date",                                                 :null => false
    t.integer  "language_id",                    :default => 0,        :null => false
    t.integer  "customers_id",                   :default => 0,        :null => false
    t.string   "email",                          :default => "",       :null => false
    t.string   "pseudo",                         :default => "",       :null => false
    t.integer  "contest_name_id",                :default => 0,        :null => false
    t.integer  "answer_id",                      :default => 0,        :null => false
    t.integer  "players",                        :default => 0,        :null => false
    t.integer  "is_a_winner",                    :default => 0,        :null => false
    t.date     "is_a_winner_date"
    t.string   "site",             :limit => 60, :default => "www",    :null => false
    t.integer  "EntityID",                       :default => 1,        :null => false
    t.integer  "unsubscribe",                    :default => 0,        :null => false
    t.integer  "is_in_prospects",                :default => 0,        :null => false
    t.string   "marketing_ok",     :limit => 0,  :default => "NOTYET", :null => false
  end

  create_table "contest_event", :primary_key => "contest_event_id", :force => true do |t|
    t.datetime "date",                                  :null => false
    t.integer  "language_id",           :default => 0,  :null => false
    t.integer  "customers_id",          :default => 0,  :null => false
    t.string   "email",                 :default => "", :null => false
    t.string   "pseudo",                :default => "", :null => false
    t.integer  "contest_event_name_id", :default => 0,  :null => false
    t.integer  "answer_id",             :default => 0,  :null => false
    t.integer  "unsubscribe",           :default => 0,  :null => false
  end

  create_table "contest_event_name", :id => false, :force => true do |t|
    t.integer "contest_event_name_id", :default => 0,  :null => false
    t.string  "contest_event_name",    :default => "", :null => false
    t.text    "comment",                               :null => false
  end

  create_table "contest_name", :id => false, :force => true do |t|
    t.integer "contest_name_id",                 :default => 0,    :null => false
    t.string  "contest_name",                    :default => "",   :null => false
    t.text    "comment",                                           :null => false
    t.string  "title_fr",         :limit => 90,  :default => "",   :null => false
    t.string  "big_title_fr"
    t.string  "title_nl",         :limit => 90,  :default => "",   :null => false
    t.string  "big_title_nl"
    t.string  "title_en",         :limit => 90,  :default => "",   :null => false
    t.string  "big_title_en"
    t.string  "question_fr",      :limit => 90,  :default => "",   :null => false
    t.string  "question_nl",      :limit => 90,  :default => "",   :null => false
    t.string  "question_en",      :limit => 90,  :default => "",   :null => false
    t.text    "choice_fr",                                         :null => false
    t.text    "choice_nl",                                         :null => false
    t.text    "choice_en",                                         :null => false
    t.text    "answer_fr",                                         :null => false
    t.text    "answer_nl",                                         :null => false
    t.text    "answer_en",                                         :null => false
    t.integer "answer_id",                       :default => 0,    :null => false
    t.string  "winners",          :limit => 6,   :default => "0",  :null => false
    t.integer "winners_selected",                                  :null => false
    t.string  "banner",           :limit => 50,  :default => "",   :null => false
    t.string  "jaquette",         :limit => 120,                   :null => false
    t.integer "active_fr",                       :default => 0,    :null => false
    t.integer "active_nl",                       :default => 0,    :null => false
    t.integer "active_en",                       :default => 0,    :null => false
    t.date    "validity"
    t.date    "available_from"
    t.integer "winners_count",                   :default => 3
    t.boolean "new",                             :default => true
  end

  create_table "countries", :primary_key => "countries_id", :force => true do |t|
    t.string  "countries_name",       :limit => 64, :default => "", :null => false
    t.string  "countries_iso_code_2", :limit => 2,  :default => "", :null => false
    t.string  "countries_iso_code_3", :limit => 3,  :default => "", :null => false
    t.integer "address_format_id",                  :default => 0,  :null => false
    t.integer "EntityID",                           :default => 1,  :null => false
  end

  add_index "countries", ["countries_name"], :name => "IDX_COUNTRIES_NAME"

  create_table "countrieslu", :primary_key => "countries_id", :force => true do |t|
    t.string  "countries_name",       :limit => 64, :default => "", :null => false
    t.string  "countries_iso_code_2", :limit => 2,  :default => "", :null => false
    t.string  "countries_iso_code_3", :limit => 3,  :default => "", :null => false
    t.integer "address_format_id",                  :default => 0,  :null => false
  end

  add_index "countrieslu", ["countries_name"], :name => "IDX_COUNTRIES_NAME"

  create_table "country", :primary_key => "countries_id", :force => true do |t|
    t.string  "countries_name",       :limit => 64, :default => "", :null => false
    t.string  "countries_iso_code_2", :limit => 2,  :default => "", :null => false
    t.string  "countries_iso_code_3", :limit => 3,  :default => "", :null => false
    t.integer "address_format_id",                  :default => 0,  :null => false
  end

  add_index "country", ["countries_name"], :name => "IDX_COUNTRIES_NAME"

  create_table "credit_action", :force => true do |t|
    t.string    "name",       :limit => 50
    t.timestamp "date_added",               :null => false
  end

  create_table "credit_history", :force => true do |t|
    t.integer   "customers_id",                    :null => false
    t.integer   "credit_action_id",                :null => false
    t.integer   "credit",           :default => 0, :null => false
    t.integer   "user_modified",                   :null => false
    t.timestamp "date_added",                      :null => false
    t.integer   "quantity_free",    :default => 0
    t.integer   "credit_free",      :default => 0
    t.integer   "quantity_paid",    :default => 0
    t.integer   "orders_id"
    t.integer   "abo_type"
    t.integer   "credit_paid",      :default => 0, :null => false
  end

  create_table "crmcountry", :primary_key => "Code", :force => true do |t|
    t.string  "Name",              :limit => 50
    t.string  "EUCode",            :limit => 10
    t.string  "IntrastatCode",     :limit => 10
    t.integer "AddrFormat"
    t.integer "AddrContactFormat"
    t.string  "ISOCode",           :limit => 2
  end

  create_table "currencies", :primary_key => "currencies_id", :force => true do |t|
    t.string   "title",           :limit => 32, :default => "", :null => false
    t.string   "code",            :limit => 3,  :default => "", :null => false
    t.string   "symbol_left",     :limit => 12
    t.string   "symbol_right",    :limit => 12
    t.string   "decimal_point",   :limit => 1
    t.string   "thousands_point", :limit => 1
    t.string   "decimal_places",  :limit => 1
    t.float    "value",           :limit => 13
    t.datetime "last_updated"
  end

  create_table "customer_attributes", :force => true do |t|
    t.integer  "customer_id"
    t.boolean  "list_indicator_close",                         :default => false
    t.integer  "number_of_logins",                             :default => 0
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bluray_owner",                                 :default => 0
    t.integer  "filter_id"
    t.string   "ab_testing",               :limit => 40
    t.boolean  "mail_copy",                                    :default => false
    t.integer  "number_of_logins_x",                           :default => 0
    t.integer  "sexuality",                                    :default => 0
    t.integer  "points",                                       :default => 0,     :null => false
    t.boolean  "combined",                                     :default => false, :null => false
    t.boolean  "newsletters_x"
    t.binary   "avatar",                   :limit => 16777215
    t.binary   "avatar_pending",           :limit => 16777215
    t.string   "nickname"
    t.string   "nickname_pending"
    t.boolean  "only_vod",                                     :default => false
    t.boolean  "credits_already_recieved",                     :default => false
    t.integer  "display_vod",                                  :default => 0
  end

  add_index "customer_attributes", ["customer_id"], :name => "index_customer_id"

  create_table "customer_points", :force => true do |t|
    t.integer "customer_id"
    t.integer "points"
    t.date    "created_on"
    t.date    "updated_on"
    t.integer "treated",     :limit => 1, :default => 0, :null => false
  end

  create_table "customer_surveys", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "response"
  end

  add_index "customer_surveys", ["customer_id"], :name => "index_customer_surveys_on_customer_id"
  add_index "customer_surveys", ["survey_id"], :name => "index_customer_surveys_on_survey_id"

  create_table "customers", :primary_key => "customers_id", :force => true do |t|
    t.integer  "EntityID",                                                                               :default => 1,        :null => false
    t.integer  "group_id",                                                                               :default => 1,        :null => false
    t.string   "customers_gender",                          :limit => 1,                                 :default => "",       :null => false
    t.string   "customers_firstname",                       :limit => 32,                                :default => "",       :null => false
    t.string   "customers_lastname",                        :limit => 32,                                :default => "",       :null => false
    t.datetime "customers_dob"
    t.string   "customers_email_address",                   :limit => 96,                                :default => "",       :null => false
    t.integer  "customers_default_address_id",                                                           :default => 1,        :null => false
    t.string   "customers_telephone",                       :limit => 32,                                :default => "",       :null => false
    t.string   "customers_telephone_evening",               :limit => 32,                                :default => "",       :null => false
    t.string   "customers_fax",                             :limit => 32
    t.string   "customers_password",                        :limit => 40,                                :default => "",       :null => false
    t.integer  "customers_newsletter"
    t.integer  "customers_newsletterpartner"
    t.integer  "customers_privilege",                                                                    :default => 0,        :null => false
    t.decimal  "customers_privilege_balance",                              :precision => 5, :scale => 2, :default => 0.0,      :null => false
    t.integer  "customers_garantie",                                                                     :default => 0,        :null => false
    t.string   "sponsoring_code",                           :limit => 10
    t.string   "sponsored_code",                            :limit => 10
    t.integer  "customers_abo",                                                                          :default => 0,        :null => false
    t.integer  "customers_abo_suspended",                                                                :default => 0,        :null => false
    t.integer  "customers_abo_type",                                                                     :default => 0,        :null => false
    t.integer  "customers_next_abo_type",                                                                :default => 0,        :null => false
    t.integer  "flagminiat1995",                                                                         :default => 0,        :null => false
    t.integer  "customers_abo_method",                                                                   :default => 0,        :null => false
    t.integer  "customers_abo_dvd_norm",                                                                 :default => 0,        :null => false
    t.integer  "customers_abo_dvd_adult",                                                                :default => 0,        :null => false
    t.integer  "customers_abo_dvd_home_norm",                                                            :default => 0,        :null => false
    t.integer  "customers_abo_dvd_home_adult",                                                           :default => 0,        :null => false
    t.integer  "throttling",                                                                             :default => 0,        :null => false
    t.datetime "customers_abo_validityto"
    t.integer  "customers_abo_rank",                                                                     :default => 10,       :null => false
    t.integer  "customers_abo_start_rentthismonth",                                                      :default => 0,        :null => false
    t.integer  "customers_abo_dvd_credit",                                                               :default => 0,        :null => false
    t.integer  "customers_abo_dvd_remain",                                                               :default => 0
    t.integer  "customers_abo_multishipment",                                                            :default => 1,        :null => false
    t.date     "customers_abo_discount_recurring_to_date"
    t.integer  "abotested",                                                                              :default => 0,        :null => false
    t.integer  "customers_abo_status",                                                                   :default => 0,        :null => false
    t.integer  "customers_abo_payment_method",                                                           :default => 0,        :null => false
    t.integer  "domiciliation_status",                                                                   :default => 0,        :null => false
    t.string   "domiciliation_debiter_name"
    t.string   "domiciliation_number",                      :limit => 50
    t.string   "domiciliation_account_number",              :limit => 50
    t.string   "adult_pwd",                                 :limit => 50
    t.string   "ogone_card_type",                           :limit => 50
    t.string   "ogone_card_no",                             :limit => 50
    t.string   "ogone_exp_date",                            :limit => 50
    t.string   "ogone_owner"
    t.integer  "ogone_cc_expiration_status",                                                             :default => 0,        :null => false
    t.integer  "offline_payment_status",                                                                 :default => 0,        :null => false
    t.text     "comment"
    t.integer  "vip",                                                                                    :default => 0,        :null => false
    t.integer  "black_listed",                                                                           :default => 0,        :null => false
    t.integer  "red_listed",                                                                             :default => 0,        :null => false
    t.integer  "sm_eligible",                                                                            :default => 0,        :null => false
    t.integer  "customers_enquiry_id",                                                                   :default => 0,        :null => false
    t.datetime "date_first_delivery"
    t.datetime "mail_wl_adult_not_sufficient"
    t.datetime "mail_wl_norm_not_sufficient"
    t.integer  "mgm_points",                                                                             :default => 0,        :null => false
    t.integer  "wishlist_kind",                                                                          :default => 2,        :null => false
    t.integer  "activation_discount_code_id",                                                            :default => 0,        :null => false
    t.string   "activation_discount_code_type",             :limit => 2,                                 :default => "",       :null => false
    t.integer  "customers_next_discount_code",                                                           :default => 0,        :null => false
    t.integer  "customers_registration_step",                                                            :default => 80,       :null => false
    t.integer  "customers_abo_auto_stop_next_reconduction",                                              :default => 0,        :null => false
    t.datetime "customers_info_date_of_last_logon"
    t.integer  "customers_info_number_of_logons"
    t.datetime "customers_info_date_account_created"
    t.datetime "customers_info_date_account_last_modified"
    t.integer  "global_product_notifications",                                                           :default => 0
    t.integer  "customers_language",                                                                     :default => 3,        :null => false
    t.string   "site",                                      :limit => 25,                                :default => "www",    :null => false
    t.integer  "partners_id",                                                                            :default => 0,        :null => false
    t.string   "belgiqueloisirs_id",                                                                     :default => "",       :null => false
    t.integer  "dvdpost_known_by",                                                                       :default => 0,        :null => false
    t.string   "selected_for_email",                        :limit => 80,                                :default => "0"
    t.integer  "is_email_valid",                                                                         :default => 1
    t.datetime "last_suspension_date"
    t.integer  "customers_locked__for_reconduction",                                                     :default => 0,        :null => false
    t.integer  "abo_not_served_reason",                                                                  :default => 0
    t.integer  "rating_users",                                                                           :default => 0,        :null => false
    t.integer  "rating_count",                                                                           :default => 0,        :null => false
    t.string   "marketing_ok",                              :limit => 0,                                 :default => "NOTYET", :null => false
    t.string   "encrypted_password",                        :limit => 128,                               :default => "",       :null => false
    t.string   "password_salt",                                                                          :default => "",       :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.string   "authentication_token"
    t.string   "verification_code"
    t.string   "refresh_token"
    t.date     "refresh_token_expires_at"
    t.date     "access_token_expires_at"
    t.boolean  "sleep",                                                                                  :default => false,    :null => false
  end

  add_index "customers", ["abo_not_served_reason"], :name => "notserved_reason"
  add_index "customers", ["authentication_token"], :name => "index_customers_on_authentication_token", :unique => true
  add_index "customers", ["customers_abo"], :name => "Abo"
  add_index "customers", ["customers_abo_payment_method"], :name => "Pay_Method"
  add_index "customers", ["customers_abo_suspended"], :name => "Abo_Suspended"
  add_index "customers", ["customers_email_address"], :name => "customers_email_address", :unique => true
  add_index "customers", ["group_id"], :name => "group_id"
  add_index "customers", ["refresh_token"], :name => "refresh"
  add_index "customers", ["remember_token"], :name => "remember"
  add_index "customers", ["reset_password_token"], :name => "index_customers_on_reset_password_token", :unique => true
  add_index "customers", ["verification_code"], :name => "Index_verifCode"

  create_table "customers_abo_payment_method", :primary_key => "customers_abo_payment_method_id", :force => true do |t|
    t.string "customers_abo_payment_method_name", :limit => 50, :default => "", :null => false
  end

  create_table "customers_abo_stop", :force => true do |t|
    t.integer  "customers_id",                 :null => false
    t.datetime "date_stop",                    :null => false
    t.integer  "reason_id",     :default => 0, :null => false
    t.string   "comment"
    t.text     "comment_users"
    t.text     "prevent_users"
  end

  create_table "customers_abo_stop_reason", :force => true do |t|
    t.string "reason", :limit => 80
  end

  create_table "customers_aboprocess_stats", :force => true do |t|
    t.integer "customers_id",                          :null => false
    t.integer "dvd_norm_to_send"
    t.integer "dvd_adult_to_send"
    t.integer "dvd_highsent"
    t.integer "dvd_mediumsent"
    t.integer "dvd_lowsent"
    t.integer "dvd_norm_abo"
    t.integer "dvd_adult_abo"
    t.integer "dvd_norm_compensation"
    t.integer "dvd_adult_compensation"
    t.integer "dvd_norm_home"
    t.integer "dvd_adult_home"
    t.integer "credit"
    t.integer "customer_abo_rank"
    t.integer "aboProcess_id"
    t.integer "reason"
    t.string  "msgerror",               :limit => 250
    t.integer "nbdvdfindnorm"
    t.integer "nbdvdfindadult"
    t.integer "nbwishlistadult"
    t.integer "nbwishlistnorm"
    t.integer "position_served"
  end

  create_table "customers_aboprocess_stats_new", :force => true do |t|
    t.integer "customers_id",                                        :null => false
    t.integer "dvd_to_send"
    t.integer "dvd_highsent"
    t.integer "dvd_mediumsent"
    t.integer "dvd_lowsent"
    t.integer "dvd_abo"
    t.integer "dvd_compensation"
    t.integer "dvd_home"
    t.integer "credit"
    t.integer "customer_abo_rank"
    t.integer "aboprocess_id"
    t.integer "reason"
    t.string  "msgerror",          :limit => 250
    t.integer "nbdvdfind"
    t.integer "nbwishlist"
    t.integer "position_served"
    t.boolean "sleep",                            :default => false
  end

  create_table "customers_aboprocess_stats_reason", :force => true do |t|
    t.string "label", :limit => 20
  end

  create_table "customers_add2ship", :primary_key => "customers_add2ship_id", :force => true do |t|
    t.integer  "customers_id",               :default => 0, :null => false
    t.string   "description",  :limit => 45
    t.datetime "create_date"
    t.integer  "nbr_to_ship"
    t.integer  "nbr_shipped",                :default => 0
    t.integer  "closed",                     :default => 0
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.string   "code",         :limit => 45
  end

  add_index "customers_add2ship", ["customers_id", "closed"], :name => "idx_cust_closed"
  add_index "customers_add2ship", ["customers_id", "code"], :name => "idx_Cust_code", :unique => true
  add_index "customers_add2ship", ["customers_id"], :name => "idx_cust"

  create_table "customers_add2ship_history", :primary_key => "customers_add2_ship_history_id", :force => true do |t|
    t.integer  "customers_id"
    t.string   "code",         :limit => 45
    t.datetime "date_shipped"
  end

  add_index "customers_add2ship_history", ["code"], :name => "idx_code"
  add_index "customers_add2ship_history", ["customers_id", "code"], :name => "idx_cust_code"
  add_index "customers_add2ship_history", ["customers_id"], :name => "Idx_cust"

  create_table "customers_basket", :primary_key => "customers_basket_id", :force => true do |t|
    t.integer "customers_id",                                                              :default => 0,   :null => false
    t.text    "products_id",                 :limit => 255,                                                 :null => false
    t.integer "customers_basket_quantity",                                                 :default => 0,   :null => false
    t.decimal "final_price",                                :precision => 15, :scale => 4, :default => 0.0, :null => false
    t.string  "customers_basket_date_added", :limit => 8
  end

  create_table "customers_basket_attributes", :primary_key => "customers_basket_attributes_id", :force => true do |t|
    t.integer "customers_id",                             :default => 0, :null => false
    t.text    "products_id",               :limit => 255,                :null => false
    t.integer "products_options_id",                      :default => 0, :null => false
    t.integer "products_options_value_id",                :default => 0, :null => false
  end

  create_table "customers_comment", :primary_key => "customers_comment_id", :force => true do |t|
    t.integer  "customers_id",              :default => 0, :null => false
    t.text     "customers_comment_text",                   :null => false
    t.datetime "customers_comment_date",                   :null => false
    t.integer  "customers_comment_adminby", :default => 0, :null => false
  end

  create_table "customers_dvd_lost", :primary_key => "customers_dvd_lost_id", :force => true do |t|
    t.integer "abo_type",                            :default => 0, :null => false
    t.integer "num_distinct_days_sent",              :default => 0, :null => false
    t.integer "num_distinct_days_lost",              :default => 0, :null => false
    t.float   "perc_lost",              :limit => 5
    t.integer "sent",                                :default => 0, :null => false
    t.integer "lost"
    t.integer "returned"
    t.integer "customers_id"
    t.date    "start_period"
    t.date    "end_period"
  end

  add_index "customers_dvd_lost", ["customers_id"], :name => "customers_id"

  create_table "customers_dvdplus", :force => true do |t|
    t.string "nom",        :limit => 30, :default => "0", :null => false
    t.string "prenom",     :limit => 17, :default => "",  :null => false
    t.string "adresse",    :limit => 79, :default => "",  :null => false
    t.string "cp",                       :default => "",  :null => false
    t.string "ville",      :limit => 36, :default => "",  :null => false
    t.string "pays",       :limit => 8,  :default => "",  :null => false
    t.string "tel",        :limit => 15, :default => "",  :null => false
    t.string "dtn",        :limit => 5,  :default => "",  :null => false
    t.string "sexe",       :limit => 5,  :default => "",  :null => false
    t.string "email",      :limit => 40, :default => "",  :null => false
    t.string "newsletter",               :default => "",  :null => false
    t.string "login",      :limit => 30, :default => "",  :null => false
    t.string "password",   :limit => 30, :default => "",  :null => false
    t.string "datum",                    :default => "",  :null => false
    t.string "etat",                     :default => "",  :null => false
    t.string "fr",         :limit => 5,  :default => "",  :null => false
    t.string "nl",         :limit => 5,  :default => "",  :null => false
    t.string "uk",         :limit => 5,  :default => "",  :null => false
    t.string "affiliates",               :default => "",  :null => false
  end

  add_index "customers_dvdplus", ["nom"], :name => "nom"
  add_index "customers_dvdplus", ["prenom"], :name => "prenom"

  create_table "customers_enquiry", :primary_key => "customers_enquiry_id", :force => true do |t|
    t.datetime "enquiry_date",                  :null => false
    t.integer  "adminby",       :default => 0,  :null => false
    t.string   "enquiry_title", :default => "", :null => false
    t.text     "enquiry_text",                  :null => false
  end

  create_table "customers_enquiry_addresses", :primary_key => "customers_enquiry_addresses_id", :force => true do |t|
    t.integer "customers_enquiry_id", :default => 0,  :null => false
    t.string  "street_address",       :default => "", :null => false
    t.string  "postcode",             :default => "", :null => false
    t.string  "city",                 :default => "", :null => false
  end

  add_index "customers_enquiry_addresses", ["postcode"], :name => "postcode"
  add_index "customers_enquiry_addresses", ["street_address"], :name => "street_address"

  create_table "customers_enquiry_agenda", :primary_key => "customers_enquiry_agenda_id", :force => true do |t|
    t.integer  "customers_enquiry_id", :default => 0,  :null => false
    t.datetime "date_added",                           :null => false
    t.date     "date_action",                          :null => false
    t.string   "action_text",          :default => "", :null => false
    t.integer  "customers_id",         :default => 0,  :null => false
    t.integer  "adminby",              :default => 0,  :null => false
    t.integer  "action_adminby",       :default => 0,  :null => false
    t.datetime "action_admindate",                     :null => false
  end

  create_table "customers_enquiry_history", :primary_key => "customers_enquiry_history_id", :force => true do |t|
    t.integer  "customers_enquiry_id", :default => 0,  :null => false
    t.datetime "enquiry_history_date",                 :null => false
    t.integer  "action_id",            :default => 0,  :null => false
    t.string   "action_text",          :default => "", :null => false
    t.integer  "customers_id",         :default => 0,  :null => false
    t.integer  "adminby",              :default => 0,  :null => false
  end

  create_table "customers_enquiry_history_action", :id => false, :force => true do |t|
    t.integer "customers_enquiry_history_action_id", :default => 0,  :null => false
    t.string  "action_name",                         :default => "", :null => false
  end

  create_table "customers_instant_profile", :primary_key => "customers_id", :force => true do |t|
    t.boolean "abo",                                                                    :default => false, :null => false
    t.integer "abo_type",                                                               :default => 0,     :null => false
    t.string  "abo_pattern",                 :limit => 1,                               :default => "",    :null => false
    t.integer "abo_pattern_info",                                                       :default => 0,     :null => false
    t.boolean "payable",                                                                :default => false, :null => false
    t.string  "payment_method",              :limit => 1,                               :default => "",    :null => false
    t.decimal "income",                                   :precision => 5, :scale => 2, :default => 0.0,   :null => false
    t.integer "dvd_norm",                                                               :default => 0,     :null => false
    t.integer "dvd_adult",                                                              :default => 0,     :null => false
    t.integer "customers_abo_dvd_credit",                                               :default => 0,     :null => false
    t.integer "at_home_norm",                                                           :default => 0,     :null => false
    t.integer "at_home_adult",                                                          :default => 0,     :null => false
    t.integer "wl_norm",                                                                :default => 0,     :null => false
    t.integer "wl_adult",                                                               :default => 0,     :null => false
    t.integer "rentals_norm",                                                           :default => 0,     :null => false
    t.integer "rentals_adult",                                                          :default => 0,     :null => false
    t.integer "delays",                                                                 :default => 0,     :null => false
    t.integer "delays_after_1juin2005",                                                 :default => 0,     :null => false
    t.integer "compensations",                                                          :default => 0,     :null => false
    t.integer "custserv_repair",                                                        :default => 0,     :null => false
    t.integer "custserv_delays",                                                        :default => 0,     :null => false
    t.integer "rentals_lastmonth",                                                      :default => 0,     :null => false
    t.integer "custserv_repair_lastmonth",                                              :default => 0,     :null => false
    t.integer "custserv_delays_lastmonth",                                              :default => 0,     :null => false
    t.integer "abo_stop",                                                               :default => 0,     :null => false
    t.integer "abo_stop_cust",                                                          :default => 0,     :null => false
    t.decimal "profitability",                            :precision => 6, :scale => 2, :default => 0.0,   :null => false
    t.integer "dvd_sent_by_kiala",                                                      :default => 0,     :null => false
    t.integer "dvd_sent_by_kiala_lastmonth",                                            :default => 0,     :null => false
  end

  create_table "customers_instant_profile_abo_pattern", :id => false, :force => true do |t|
    t.string "abo_pattern", :default => "", :null => false
    t.string "name",        :default => "", :null => false
  end

  create_table "customers_invoice", :id => false, :force => true do |t|
    t.integer   "customers_invoice_id",                                                               :null => false
    t.string    "type_payment",         :limit => 0,                                                  :null => false
    t.string    "status",               :limit => 0,                                                  :null => false
    t.integer   "customers_id",                                                                       :null => false
    t.string    "communication",        :limit => 45
    t.decimal   "amount",                             :precision => 10, :scale => 2,                  :null => false
    t.timestamp "date_added",                                                                         :null => false
    t.datetime  "last_modified",                                                                      :null => false
    t.integer   "user_modified",                                                                      :null => false
    t.integer   "reason_canceled_id"
    t.integer   "batch_id"
    t.integer   "temp_id"
    t.integer   "temp_recovery_id"
    t.decimal   "amount_received",                    :precision => 10, :scale => 2, :default => 0.0, :null => false
  end

  create_table "customers_last_deliveries_norm", :primary_key => "customers_last_deliveries_norm_id", :force => true do |t|
    t.integer "customers_id"
    t.date    "date_last_attempt"
    t.integer "sent"
    t.integer "minrank"
    t.integer "maxrank"
  end

  add_index "customers_last_deliveries_norm", ["customers_id"], :name => "customers_id"

  create_table "customers_media_allowed", :id => false, :force => true do |t|
    t.integer "customers_id",                 :default => 0,  :null => false
    t.string  "products_media", :limit => 30, :default => "", :null => false
  end

  create_table "customers_offline_payment_status", :id => false, :force => true do |t|
    t.integer "id",   :default => 0,  :null => false
    t.string  "name", :default => "", :null => false
  end

  create_table "customers_old", :id => false, :force => true do |t|
    t.integer  "customers_id",                                                                           :default => 0,        :null => false
    t.integer  "EntityID",                                                                               :default => 1,        :null => false
    t.integer  "group_id",                                                                               :default => 1,        :null => false
    t.string   "customers_gender",                          :limit => 1,                                 :default => "",       :null => false
    t.string   "customers_lastname",                        :limit => 32,                                :default => "",       :null => false
    t.datetime "customers_dob"
    t.string   "customers_email_address",                   :limit => 96,                                :default => "",       :null => false
    t.integer  "customers_default_address_id",                                                           :default => 1,        :null => false
    t.string   "customers_telephone",                       :limit => 32,                                :default => "",       :null => false
    t.string   "customers_telephone_evening",               :limit => 32,                                :default => "",       :null => false
    t.string   "customers_fax",                             :limit => 32
    t.string   "customers_password",                        :limit => 40,                                :default => "",       :null => false
    t.integer  "customers_newsletter"
    t.integer  "customers_newsletterpartner"
    t.integer  "customers_privilege",                                                                    :default => 0,        :null => false
    t.decimal  "customers_privilege_balance",                              :precision => 5, :scale => 2, :default => 0.0,      :null => false
    t.integer  "customers_garantie",                                                                     :default => 0,        :null => false
    t.string   "customers_firstname",                       :limit => 32,                                :default => "",       :null => false
    t.string   "sponsoring_code",                           :limit => 10
    t.string   "sponsored_code",                            :limit => 10
    t.integer  "customers_abo",                                                                          :default => 0,        :null => false
    t.integer  "customers_abo_suspended",                                                                :default => 0,        :null => false
    t.integer  "customers_abo_type",                                                                     :default => 0,        :null => false
    t.integer  "customers_next_abo_type",                                                                :default => 0,        :null => false
    t.integer  "flagminiat1995",                                                                         :default => 0,        :null => false
    t.integer  "customers_abo_method",                                                                   :default => 0,        :null => false
    t.integer  "customers_abo_dvd_norm",                                                                 :default => 0,        :null => false
    t.integer  "customers_abo_dvd_adult",                                                                :default => 0,        :null => false
    t.integer  "customers_abo_dvd_home_norm",                                                            :default => 0,        :null => false
    t.integer  "customers_abo_dvd_home_adult",                                                           :default => 0,        :null => false
    t.integer  "throttling",                                                                             :default => 0,        :null => false
    t.datetime "customers_abo_validityto"
    t.integer  "customers_abo_rank",                                                                     :default => 10,       :null => false
    t.integer  "customers_abo_start_rentthismonth",                                                      :default => 0,        :null => false
    t.integer  "customers_abo_dvd_credit",                                                               :default => 0,        :null => false
    t.integer  "customers_abo_dvd_remain",                                                               :default => 0
    t.integer  "customers_abo_multishipment",                                                            :default => 1,        :null => false
    t.date     "customers_abo_discount_recurring_to_date"
    t.integer  "abotested",                                                                              :default => 0,        :null => false
    t.integer  "customers_abo_status",                                                                   :default => 0,        :null => false
    t.integer  "customers_abo_payment_method",                                                           :default => 0,        :null => false
    t.integer  "domiciliation_status",                                                                   :default => 0,        :null => false
    t.string   "domiciliation_debiter_name"
    t.string   "domiciliation_number",                      :limit => 50
    t.string   "domiciliation_account_number",              :limit => 50
    t.string   "adult_pwd",                                 :limit => 50
    t.string   "ogone_card_type",                           :limit => 50
    t.string   "ogone_card_no",                             :limit => 50
    t.string   "ogone_exp_date",                            :limit => 50
    t.string   "ogone_owner"
    t.integer  "ogone_cc_expiration_status",                                                             :default => 0,        :null => false
    t.integer  "offline_payment_status",                                                                 :default => 0,        :null => false
    t.text     "comment"
    t.integer  "vip",                                                                                    :default => 0,        :null => false
    t.integer  "black_listed",                                                                           :default => 0,        :null => false
    t.integer  "red_listed",                                                                             :default => 0,        :null => false
    t.integer  "sm_eligible",                                                                            :default => 0,        :null => false
    t.integer  "customers_enquiry_id",                                                                   :default => 0,        :null => false
    t.datetime "date_first_delivery"
    t.datetime "mail_wl_adult_not_sufficient"
    t.datetime "mail_wl_norm_not_sufficient"
    t.integer  "mgm_points",                                                                             :default => 0,        :null => false
    t.integer  "wishlist_kind",                                                                          :default => 2,        :null => false
    t.integer  "activation_discount_code_id",                                                            :default => 0,        :null => false
    t.string   "activation_discount_code_type",             :limit => 2,                                 :default => "",       :null => false
    t.integer  "customers_next_discount_code",                                                           :default => 0,        :null => false
    t.integer  "customers_registration_step",                                                            :default => 80,       :null => false
    t.integer  "customers_abo_auto_stop_next_reconduction",                                              :default => 0,        :null => false
    t.datetime "customers_info_date_of_last_logon"
    t.integer  "customers_info_number_of_logons"
    t.datetime "customers_info_date_account_created"
    t.datetime "customers_info_date_account_last_modified"
    t.integer  "global_product_notifications",                                                           :default => 0
    t.integer  "customers_language",                                                                     :default => 3,        :null => false
    t.string   "site",                                      :limit => 25,                                :default => "www",    :null => false
    t.integer  "partners_id",                                                                            :default => 0,        :null => false
    t.string   "belgiqueloisirs_id",                                                                     :default => "",       :null => false
    t.integer  "dvdpost_known_by",                                                                       :default => 0,        :null => false
    t.string   "selected_for_email",                        :limit => 80,                                :default => "0"
    t.integer  "is_email_valid",                                                                         :default => 1
    t.datetime "last_suspension_date"
    t.integer  "customers_locked__for_reconduction",                                                     :default => 0,        :null => false
    t.integer  "abo_not_served_reason",                                                                  :default => 0
    t.integer  "rating_users",                                                                           :default => 0,        :null => false
    t.integer  "rating_count",                                                                           :default => 0,        :null => false
    t.string   "marketing_ok",                              :limit => 0,                                 :default => "NOTYET", :null => false
    t.string   "encrypted_password",                        :limit => 128,                               :default => "",       :null => false
    t.string   "password_salt",                                                                          :default => "",       :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.string   "authentication_token"
    t.string   "verification_code"
    t.string   "refresh_token"
    t.date     "refresh_token_expires_at"
    t.date     "access_token_expires_at"
    t.boolean  "sleep",                                                                                  :default => false,    :null => false
  end

  create_table "customers_payback", :primary_key => "customers_payback_id", :force => true do |t|
    t.integer  "customers_id",                               :default => 0,   :null => false
    t.datetime "date",                                                        :null => false
    t.decimal  "amount",       :precision => 4, :scale => 2, :default => 0.0, :null => false
    t.text     "comment",                                                     :null => false
  end

  create_table "customers_payments", :id => false, :force => true do |t|
    t.integer   "customers_payments_id",                                                               :null => false
    t.integer   "customers_id",                                                                        :null => false
    t.decimal   "debit",                               :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.decimal   "credit",                              :precision => 12, :scale => 2, :default => 0.0, :null => false
    t.timestamp "date_added",                                                                          :null => false
    t.timestamp "date_modified",                                                                       :null => false
    t.string    "user_modified",         :limit => 45,                                                 :null => false
  end

  create_table "customers_points_history", :primary_key => "customers_points_history_id", :force => true do |t|
    t.integer  "customers_id", :default => 0, :null => false
    t.datetime "date",                        :null => false
    t.integer  "action",       :default => 0, :null => false
    t.integer  "sub_action",   :default => 0, :null => false
    t.integer  "points",       :default => 0, :null => false
  end

  create_table "customers_points_history_action", :id => false, :force => true do |t|
    t.integer "action_id",   :default => 0,   :null => false
    t.string  "action_name", :default => "0", :null => false
  end

  create_table "customers_points_history_sub_action", :id => false, :force => true do |t|
    t.integer "sub_action_id",   :default => 0,   :null => false
    t.string  "sub_action_name", :default => "0", :null => false
  end

  create_table "customers_roles", :id => false, :force => true do |t|
    t.integer  "customer_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers_roles", ["customer_id"], :name => "index_customers_roles_on_customer_id"
  add_index "customers_roles", ["role_id"], :name => "index_customers_roles_on_role_id"

  create_table "customers_rotations", :id => false, :force => true do |t|
    t.integer  "customer_id",  :null => false
    t.datetime "create_at",    :null => false
    t.integer  "time_average"
  end

  create_table "customers_stop_profile", :primary_key => "customers_stop_profile_id", :force => true do |t|
    t.date    "date",                                              :null => false
    t.integer "customers_id",                      :default => 0,  :null => false
    t.integer "abo_type",                          :default => 0,  :null => false
    t.string  "abo_pattern",          :limit => 1, :default => "", :null => false
    t.integer "abo_pattern_info",                  :default => 0,  :null => false
    t.integer "abo_pattern_info_act",              :default => 0,  :null => false
    t.integer "nbr_recond",                        :default => 0,  :null => false
  end

  add_index "customers_stop_profile", ["abo_pattern"], :name => "abo_pattern"
  add_index "customers_stop_profile", ["customers_id"], :name => "customers_id"
  add_index "customers_stop_profile", ["date"], :name => "date"

  create_table "custserv", :primary_key => "custserv_id", :force => true do |t|
    t.integer  "customers_id",             :default => 0,     :null => false
    t.integer  "language_id",              :default => 0,     :null => false
    t.integer  "custserv_cat_id",          :default => 0,     :null => false
    t.datetime "customer_date",                               :null => false
    t.integer  "orders_id",                :default => 0,     :null => false
    t.integer  "products_id"
    t.integer  "dvd_id"
    t.string   "subject"
    t.text     "message"
    t.datetime "admindate"
    t.integer  "adminby"
    t.text     "adminmessage"
    t.integer  "messagesent"
    t.integer  "dvd_finally_arrived_mail", :default => 0,     :null => false
    t.boolean  "read",                     :default => false
    t.boolean  "is_read",                  :default => false
  end

  add_index "custserv", ["customers_id"], :name => "customers_id"
  add_index "custserv", ["custserv_cat_id"], :name => "custserv_cat_id"
  add_index "custserv", ["dvd_id"], :name => "dvd_id"
  add_index "custserv", ["orders_id"], :name => "orders_id"
  add_index "custserv", ["products_id"], :name => "products_id"

  create_table "custserv_auto_answer", :id => false, :force => true do |t|
    t.integer "custserv_auto_answer_id",      :default => 0,  :null => false
    t.integer "language_id",                  :default => 0,  :null => false
    t.string  "custserv_auto_answer_comment", :default => "", :null => false
    t.text    "messages_html",                                :null => false
  end

  create_table "custserv_cat", :id => false, :force => true do |t|
    t.integer "custserv_cat_id",   :default => 0,  :null => false
    t.integer "language_id",       :default => 0,  :null => false
    t.string  "custserv_cat_name", :default => "", :null => false
  end

  create_table "custserv_delayed_finallyarrived", :primary_key => "custserv_delayed_finallyarrived_id", :force => true do |t|
    t.integer  "custserv_id",   :default => 0, :null => false
    t.integer  "customers_id",  :default => 0, :null => false
    t.datetime "customer_date",                :null => false
    t.integer  "orders_id",     :default => 0, :null => false
    t.integer  "products_id",   :default => 0, :null => false
    t.integer  "dvd_id",        :default => 0, :null => false
  end

  create_table "custserv_faq", :id => false, :force => true do |t|
    t.integer "custserv_faq_id",      :default => 0,  :null => false
    t.integer "language_id",          :default => 0,  :null => false
    t.string  "custserv_faq_comment", :default => "", :null => false
    t.text    "messages_html",                        :null => false
  end

  create_table "custserv_msg", :id => false, :force => true do |t|
    t.integer "mail_messages_id",  :default => 0,  :null => false
    t.integer "language_id",       :default => 0,  :null => false
    t.string  "messages_subject",  :default => "", :null => false
    t.string  "messages_tag_name", :default => "", :null => false
    t.text    "messages_html",                     :null => false
  end

  create_table "custserv_references", :force => true do |t|
    t.string   "name"
    t.integer  "reference_id"
    t.integer  "message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "custserv_signature", :id => false, :force => true do |t|
    t.integer "mail_messages_id",   :default => 0,  :null => false
    t.string  "signature_subject",  :default => "", :null => false
    t.string  "signature_tag_name", :default => "", :null => false
    t.text    "signature_html",                     :null => false
  end

  create_table "directors", :primary_key => "directors_id", :force => true do |t|
    t.string  "directors_name",        :limit => 50, :default => "",           :null => false
    t.string  "directors_image",       :limit => 50, :default => "directors/"
    t.string  "directors_dateofbirth", :limit => 30
    t.text    "directors_description"
    t.text    "directors_awards"
    t.integer "top_directors",                       :default => 0
    t.string  "cached_slug"
  end

  add_index "directors", ["cached_slug"], :name => "index_directors_on_cached_slug", :unique => true

  create_table "discount_abo_validityto_type", :id => false, :force => true do |t|
    t.integer "discount_abo_validityto_type_id",   :default => 0,  :null => false
    t.string  "discount_abo_validityto_type_name", :default => "", :null => false
  end

  create_table "discount_code", :primary_key => "discount_code_id", :force => true do |t|
    t.string  "discount_code",                   :limit => 50,                               :default => "",          :null => false
    t.integer "discount_type",                                                               :default => 0,           :null => false
    t.decimal "discount_value",                                :precision => 6, :scale => 2, :default => 0.0,         :null => false
    t.integer "discount_limit",                                                              :default => 1,           :null => false
    t.integer "discount_commitment",                                                         :default => 1,           :null => false
    t.integer "discount_status",                                                             :default => 1,           :null => false
    t.string  "discount_text_fr",                                                            :default => "",          :null => false
    t.string  "discount_text_nl",                                                            :default => "",          :null => false
    t.string  "discount_text_en",                                                            :default => "",          :null => false
    t.integer "discount_abo_validityto_type",                                                :default => 0,           :null => false
    t.integer "discount_abo_validityto_value",                                               :default => 0,           :null => false
    t.text    "comment"
    t.integer "discount_nbr_month_before_reuse",                                             :default => 3,           :null => false
    t.integer "discount_recurring_nbr_of_month",                                             :default => 0,           :null => false
    t.integer "bypass_discountuse",                                                          :default => 0,           :null => false
    t.date    "discount_validityto"
    t.integer "payable",                                                                     :default => 0,           :null => false
    t.integer "abo_dvd_credit",                                                              :default => 0,           :null => false
    t.integer "next_discount",                                                               :default => 0,           :null => false
    t.integer "credit0_auto_reconduct",                                                      :default => 0,           :null => false
    t.integer "landing_page",                                                                :default => 0,           :null => false
    t.string  "landing_page_php",                :limit => 50
    t.string  "listing_products_allowed",        :limit => 50
    t.integer "abo_auto_stop_next_reconduction",                                             :default => 0,           :null => false
    t.integer "goto_step",                                                                   :default => 31,          :null => false
    t.string  "banner",                          :limit => 30
    t.string  "Footer",                          :limit => 25,                               :default => "FREETRIAL", :null => false
    t.integer "free_upgrade_allowed",                                                        :default => 0,           :null => false
    t.integer "group_id",                                                                    :default => 0,           :null => false
    t.string  "shopping_discount",               :limit => 25
    t.integer "droselia",                                                                                             :null => false
    t.integer "next_abo_type"
    t.integer "abo_dvd_remain",                                                              :default => 0
  end

  add_index "discount_code", ["discount_code"], :name => "discount_code", :unique => true

  create_table "discount_type", :primary_key => "discount_type", :force => true do |t|
    t.text "discount_explained", :null => false
  end

  create_table "discount_use", :primary_key => "discount_use_id", :force => true do |t|
    t.integer  "discount_code_id",  :default => 0, :null => false
    t.datetime "discount_use_date",                :null => false
    t.integer  "customers_id",      :default => 0, :null => false
  end

  create_table "distributors", :primary_key => "distributors_id", :force => true do |t|
    t.string "name",              :limit => 50, :default => "", :null => false
    t.string "address",                         :default => "", :null => false
    t.string "phone",             :limit => 50, :default => "", :null => false
    t.string "email",                           :default => "", :null => false
    t.text   "titles",                                          :null => false
    t.string "distributors_type", :limit => 10, :default => "", :null => false
  end

  create_table "dnv_dom", :primary_key => "dnv_dom_id", :force => true do |t|
    t.integer  "customers_id",               :default => 0,  :null => false
    t.datetime "date",                                       :null => false
    t.string   "domnum",       :limit => 50, :default => "", :null => false
  end

  create_table "dnv_payment", :primary_key => "dnv_payment_id", :force => true do |t|
    t.datetime "date",                            :null => false
    t.integer  "customers_id",     :default => 0, :null => false
    t.integer  "abo_type",         :default => 0, :null => false
    t.integer  "discount_code_id", :default => 0, :null => false
    t.integer  "status",           :default => 0, :null => false
  end

  add_index "dnv_payment", ["customers_id"], :name => "customers_id"

  create_table "dnv_payment_status", :id => false, :force => true do |t|
    t.integer "dnv_payment_status_id", :default => 0,  :null => false
    t.string  "status_name",           :default => "", :null => false
  end

  create_table "dnv_payment_status_history", :primary_key => "dnv_payment_status_history_id", :force => true do |t|
    t.integer  "dnv_payment_id", :default => 0, :null => false
    t.integer  "new_value",      :default => 0, :null => false
    t.integer  "old_value",      :default => 0, :null => false
    t.datetime "date",                          :null => false
  end

  create_table "dnv_reconduction", :primary_key => "spector_reconduction_id", :force => true do |t|
    t.datetime "date",                        :null => false
    t.integer  "customers_id", :default => 0, :null => false
  end

  create_table "dnv_reconduction2", :primary_key => "spector_reconduction_id", :force => true do |t|
    t.datetime "date",                        :null => false
    t.integer  "customers_id", :default => 0, :null => false
  end

  create_table "dom_update", :primary_key => "dom_update_id", :force => true do |t|
    t.integer  "customers_id",               :default => 0,  :null => false
    t.datetime "date",                                       :null => false
    t.string   "domnum",       :limit => 50, :default => "", :null => false
    t.integer  "dom_status",                 :default => 0,  :null => false
  end

  create_table "domiciliation2", :primary_key => "domiciliation_id", :force => true do |t|
    t.integer  "customers_id",                                                                  :default => 0,   :null => false
    t.datetime "orders_date",                                                                                    :null => false
    t.integer  "language",                                                                      :default => 0,   :null => false
    t.integer  "products_id",                                                                   :default => 0,   :null => false
    t.decimal  "domiciliation_first_month_payment",              :precision => 15, :scale => 2
    t.integer  "domiciliation_discount_code",                                                   :default => 0,   :null => false
    t.string   "domiciliation_discount_code_type",  :limit => 2,                                :default => "0", :null => false
    t.integer  "site",                                                                          :default => 0,   :null => false
    t.integer  "abo_id",                                                                        :default => 0,   :null => false
  end

  add_index "domiciliation2", ["customers_id"], :name => "customers_id"
  add_index "domiciliation2", ["orders_date"], :name => "orders_date"

  create_table "domiciliation2_bcmc", :primary_key => "domiciliation2_bcmc_id", :force => true do |t|
    t.integer  "customers_id", :default => 0, :null => false
    t.datetime "date",                        :null => false
    t.integer  "language",     :default => 0, :null => false
  end

  add_index "domiciliation2_bcmc", ["customers_id"], :name => "customers_id"
  add_index "domiciliation2_bcmc", ["date"], :name => "orders_date"

  create_table "domiciliation2_bcmc_relaunch", :primary_key => "jfu_reconduction_id", :force => true do |t|
    t.datetime "date",                        :null => false
    t.integer  "customers_id", :default => 0, :null => false
  end

  add_index "domiciliation2_bcmc_relaunch", ["customers_id"], :name => "customers_id"

  create_table "domiciliation2_bcmc_relaunch2", :primary_key => "jfu_reconduction_id", :force => true do |t|
    t.datetime "date",                        :null => false
    t.integer  "customers_id", :default => 0, :null => false
  end

  add_index "domiciliation2_bcmc_relaunch2", ["customers_id"], :name => "customers_id"

  create_table "domiciliation2_cancelled", :primary_key => "domiciliation_id", :force => true do |t|
    t.integer  "customers_id",                                                     :default => 0, :null => false
    t.datetime "orders_date",                                                                     :null => false
    t.integer  "language",                                                         :default => 0, :null => false
    t.integer  "products_id",                                                      :default => 0, :null => false
    t.decimal  "domiciliation_first_month_payment", :precision => 15, :scale => 4
    t.integer  "domiciliation_discount_code",                                      :default => 0, :null => false
    t.integer  "domiciliation_discount_code_type",                                 :default => 0, :null => false
    t.integer  "site",                                                             :default => 0, :null => false
    t.integer  "abo_id",                                                           :default => 0, :null => false
  end

  add_index "domiciliation2_cancelled", ["customers_id"], :name => "customers_id"

  create_table "domiciliation2_relaunch", :primary_key => "jfu_reconduction_id", :force => true do |t|
    t.datetime "date",                        :null => false
    t.integer  "customers_id", :default => 0, :null => false
  end

  add_index "domiciliation2_relaunch", ["customers_id"], :name => "customers_id"

  create_table "domiciliation2_relaunch2", :primary_key => "jfu_reconduction_id", :force => true do |t|
    t.datetime "date",                        :null => false
    t.integer  "customers_id", :default => 0, :null => false
  end

  add_index "domiciliation2_relaunch2", ["customers_id"], :name => "customers_id"

  create_table "domiciliation_bcmc_status_history2", :primary_key => "domiciliation_status_history_id", :force => true do |t|
    t.integer  "domiciliation_id",  :default => 0, :null => false
    t.integer  "new_value",         :default => 0, :null => false
    t.integer  "old_value"
    t.datetime "date_added",                       :null => false
    t.integer  "customer_notified", :default => 0, :null => false
  end

  create_table "domiciliation_number_history", :primary_key => "domiciliation_number_history_id", :force => true do |t|
    t.datetime "date",                                                       :null => false
    t.integer  "customers_id",                               :default => 0,  :null => false
    t.string   "domiciliation_number",         :limit => 50, :default => "", :null => false
    t.string   "domiciliation_account_number", :limit => 50, :default => "", :null => false
    t.string   "domiciliation_debiter_name",   :limit => 50, :default => "", :null => false
  end

  create_table "domiciliation_payment", :primary_key => "domiciliation_payment_id", :force => true do |t|
    t.date     "domiciliation_payment_date"
    t.integer  "abo_id",                                                                         :default => 0,   :null => false
    t.integer  "customers_id",                                                                   :default => 0,   :null => false
    t.string   "customers_name",                                                                 :default => "",  :null => false
    t.string   "customers_address",                                                              :default => "",  :null => false
    t.decimal  "amount",                                          :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.string   "strdomiciliation_debiter_name",                                                  :default => "",  :null => false
    t.string   "strdomiciliation_number",                                                        :default => "",  :null => false
    t.string   "communication",                                                                  :default => "",  :null => false
    t.integer  "first_payment",                                                                  :default => 0,   :null => false
    t.integer  "reconduction",                                                                   :default => 0,   :null => false
    t.integer  "domiciliation_payment_status",                                                   :default => 0,   :null => false
    t.datetime "domiciliation_payment_isabel_date"
    t.integer  "domiciliation_unpaid_id",                                                        :default => 0,   :null => false
    t.string   "batch_immatriculation_number",      :limit => 10
    t.datetime "last_modified"
    t.integer  "abo_stopped_with_dvdathome_id"
    t.integer  "account_movements_id"
    t.decimal  "amount_remaining",                                :precision => 10, :scale => 2,                  :null => false
    t.integer  "payment_status"
  end

  add_index "domiciliation_payment", ["abo_id"], :name => "abo_id"
  add_index "domiciliation_payment", ["communication"], :name => "communication"
  add_index "domiciliation_payment", ["strdomiciliation_number"], :name => "strdomiciliation_number"

  create_table "domiciliation_payment_status", :force => true do |t|
    t.string "name",        :limit => 32
    t.string "description", :limit => 128
  end

  create_table "domiciliation_payment_status_history", :primary_key => "domiciliation_payment_status_history_id", :force => true do |t|
    t.integer  "domiciliation_payment_id"
    t.integer  "new_status"
    t.integer  "old_status"
    t.datetime "date_added"
  end

  add_index "domiciliation_payment_status_history", ["domiciliation_payment_id"], :name => "domiciliation_payment_id"

  create_table "domiciliation_status", :id => false, :force => true do |t|
    t.integer "domiciliation_status_id",   :default => 0,  :null => false
    t.integer "language_id",               :default => 1,  :null => false
    t.string  "domiciliation_status_name", :default => "", :null => false
  end

  add_index "domiciliation_status", ["domiciliation_status_name"], :name => "idx_orders_status_name"

  create_table "domiciliation_status2", :id => false, :force => true do |t|
    t.integer "domiciliation_status_id",   :default => 0,  :null => false
    t.integer "language_id",               :default => 1,  :null => false
    t.string  "domiciliation_status_name", :default => "", :null => false
  end

  add_index "domiciliation_status2", ["domiciliation_status_name"], :name => "idx_orders_status_name"

# Could not dump table "domiciliation_status_history" because of following ArgumentError
#   invalid byte sequence in UTF-8

  create_table "domiciliation_status_history2", :primary_key => "domiciliation_status_history_id", :force => true do |t|
    t.integer  "domiciliation_id",  :default => 0, :null => false
    t.integer  "new_value",         :default => 0, :null => false
    t.integer  "old_value"
    t.datetime "date_added",                       :null => false
    t.integer  "customer_notified", :default => 0, :null => false
  end

  create_table "domiciliation_unpaid", :primary_key => "domiciliation_unpaid_id", :force => true do |t|
    t.string   "coda_filename",            :limit => 64
    t.date     "date_coda_created"
    t.string   "remise",                   :limit => 50,                                :default => "",  :null => false
    t.date     "date_pivot",                                                                             :null => false
    t.integer  "pivot_id",                                                              :default => 0,   :null => false
    t.string   "reference",                :limit => 25
    t.string   "reference_original",       :limit => 25,                                :default => "",  :null => false
    t.decimal  "amount",                                 :precision => 15, :scale => 2, :default => 0.0, :null => false
    t.string   "communication",            :limit => 25,                                :default => "",  :null => false
    t.string   "domiciliation_number",     :limit => 25,                                :default => "",  :null => false
    t.string   "motif",                    :limit => 50,                                :default => "",  :null => false
    t.datetime "date_added"
    t.integer  "domiciliation_payment_id",                                              :default => 0,   :null => false
    t.integer  "customers_id",                                                          :default => 0,   :null => false
    t.integer  "status",                                                                :default => 1,   :null => false
    t.string   "dvdpost_bank_account",     :limit => 12
    t.integer  "account_movements_id"
  end

  add_index "domiciliation_unpaid", ["reference"], :name => "reference"

  create_table "domiciliation_unpaid_past", :primary_key => "domiciliation_unpaid_past_id", :force => true do |t|
    t.integer "customers_id"
    t.string  "customers_name",   :limit => 32
    t.decimal "amount",                         :precision => 12, :scale => 3
    t.string  "bank_account",     :limit => 12
    t.date    "date_recovered"
    t.float   "amount_recovered", :limit => 11,                                :default => 0.0
  end

  add_index "domiciliation_unpaid_past", ["customers_id"], :name => "customers_id"

  create_table "domiciliation_unpaid_status", :force => true do |t|
    t.string "name",        :limit => 32
    t.string "description", :limit => 128
  end

  create_table "droselia_catalog", :primary_key => "catalog_id", :force => true do |t|
    t.date    "date",                                             :null => false
    t.text    "name",                                             :null => false
    t.text    "description",                                      :null => false
    t.text    "preview_description",                              :null => false
    t.string  "duration",            :limit => 6,                 :null => false
    t.integer "weight",                                           :null => false
    t.string  "format",              :limit => 10,                :null => false
    t.text    "file",                                             :null => false
    t.integer "hq",                                               :null => false
    t.integer "video_in_french",                                  :null => false
    t.integer "top_rank",                                         :null => false
    t.integer "top_rank_before",                                  :null => false
    t.text    "directory_thumbs",                                 :null => false
    t.integer "nb_thumbs",                                        :null => false
    t.integer "censored_thumbs",                                  :null => false
    t.integer "is_active",                         :default => 1, :null => false
  end

  create_table "droselia_catalog_stream", :primary_key => "catalog_id", :force => true do |t|
    t.date    "date",                                               :null => false
    t.text    "name",                                               :null => false
    t.text    "description",                                        :null => false
    t.text    "preview_description",                                :null => false
    t.string  "duration",            :limit => 6,                   :null => false
    t.integer "weight",                                             :null => false
    t.string  "trash",               :limit => 0, :default => "NO"
    t.text    "file_avi",                                           :null => false
    t.text    "file_mpg",                                           :null => false
    t.text    "file_flv",                                           :null => false
    t.text    "file_m4v",                                           :null => false
    t.integer "video_in_french",                                    :null => false
    t.integer "top_rank",                                           :null => false
    t.integer "top_rank_before",                                    :null => false
    t.text    "directory_thumbs",                                   :null => false
    t.integer "nb_thumbs",                                          :null => false
    t.integer "censored_thumbs",                                    :null => false
    t.integer "is_active",                        :default => 1,    :null => false
  end

  create_table "droselia_category", :primary_key => "category_id", :force => true do |t|
    t.string  "category_fr", :limit => 70, :null => false
    t.string  "category_nl", :limit => 70, :null => false
    t.string  "category_en", :limit => 70, :null => false
    t.integer "group",                     :null => false
  end

  create_table "droselia_category_stream", :primary_key => "category_id", :force => true do |t|
    t.string  "category_fr", :limit => 70, :null => false
    t.string  "category_nl", :limit => 70, :null => false
    t.string  "category_en", :limit => 70, :null => false
    t.integer "group",                     :null => false
  end

  create_table "droselia_category_to_catalog", :id => false, :force => true do |t|
    t.integer "catalog_id",  :null => false
    t.integer "category_id", :null => false
  end

  create_table "droselia_category_to_catalog_stream", :id => false, :force => true do |t|
    t.integer "catalog_id",  :null => false
    t.integer "category_id", :null => false
  end

  create_table "droselia_codes", :force => true do |t|
    t.string  "droselia_codes", :limit => 40,  :null => false
    t.integer "customers_id",                  :null => false
    t.date    "buy_date"
    t.date    "used_date"
    t.integer "catalog_id",                    :null => false
    t.string  "url_link",       :limit => 120, :null => false
  end

  add_index "droselia_codes", ["customers_id"], :name => "customers"
  add_index "droselia_codes", ["droselia_codes"], :name => "droselia_codes"

  create_table "dvdencoded", :force => true do |t|
    t.integer  "products_id",  :default => 0, :null => false
    t.integer  "encodedby",    :default => 0, :null => false
    t.datetime "encodeddate",                 :null => false
    t.integer  "verifiedby",   :default => 0, :null => false
    t.datetime "verifieddate",                :null => false
  end

  create_table "dvdpost_departments", :force => true do |t|
    t.string "name", :default => "", :null => false
  end

  create_table "dvdpost_employee_status", :force => true do |t|
    t.string "name", :default => "", :null => false
  end

  create_table "dvdpost_orders", :primary_key => "dvdpost_orders_id", :force => true do |t|
    t.integer "suppliers_id",                                                     :default => 0,   :null => false
    t.date    "date_ordered"
    t.integer "dvdpost_login_id",                                                 :default => 0,   :null => false
    t.decimal "total_price",                       :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.integer "status_id"
    t.date    "date_closed"
    t.string  "dvdpost_orders_type", :limit => 10,                                :default => "",  :null => false
  end

  add_index "dvdpost_orders", ["date_ordered"], :name => "date_ordered"
  add_index "dvdpost_orders", ["suppliers_id"], :name => "suppliers_id"

  create_table "dvdpost_orders_products", :primary_key => "dvdpost_orders_products_id", :force => true do |t|
    t.integer  "dvdpost_orders_id"
    t.integer  "products_id",                                                   :default => 0,   :null => false
    t.string   "products_name",                                                 :default => "",  :null => false
    t.string   "products_options",  :limit => 50,                               :default => "",  :null => false
    t.decimal  "unit_price",                      :precision => 5, :scale => 2, :default => 0.0, :null => false
    t.integer  "quantity_ordered",                                              :default => 0,   :null => false
    t.integer  "status_id",                                                     :default => 1,   :null => false
    t.datetime "last_modified",                                                                  :null => false
    t.integer  "quantity_received",                                             :default => 0,   :null => false
    t.integer  "owner_id",                                                      :default => 0,   :null => false
    t.date     "date_created",                                                                   :null => false
    t.integer  "suppliers_id",                                                  :default => 0,   :null => false
    t.decimal  "price_feesharing",                :precision => 3, :scale => 2
  end

  add_index "dvdpost_orders_products", ["dvdpost_orders_id"], :name => "dvdpost_orders_id"
  add_index "dvdpost_orders_products", ["products_id"], :name => "products_id"
  add_index "dvdpost_orders_products", ["status_id"], :name => "status_id"
  add_index "dvdpost_orders_products", ["suppliers_id"], :name => "suppliers_id"

  create_table "dvdpostlogin", :force => true do |t|
    t.string  "login",                 :limit => 50, :default => "0", :null => false
    t.string  "pwd",                   :limit => 50, :default => "",  :null => false
    t.string  "name",                  :limit => 50, :default => "",  :null => false
    t.string  "surname",                             :default => "",  :null => false
    t.string  "email",                               :default => "",  :null => false
    t.integer "dvdpost_department_id",               :default => 0,   :null => false
    t.integer "status",                              :default => 0,   :null => false
  end

  create_table "emails", :primary_key => "emails_id", :force => true do |t|
    t.string   "account",        :limit => 25, :default => "", :null => false
    t.datetime "date_processed",                               :null => false
    t.text     "_from"
    t.text     "_to"
    t.text     "_replyto"
    t.text     "headers"
    t.text     "subject"
    t.text     "msg_html"
    t.text     "body"
    t.text     "full"
    t.string   "uid"
    t.string   "messageid"
    t.datetime "date_sent"
    t.integer  "customers_id",                 :default => 0,  :null => false
    t.integer  "ok",                           :default => 0,  :null => false
    t.integer  "postmaster",                   :default => 0,  :null => false
    t.integer  "spam",                         :default => 0,  :null => false
    t.integer  "likecust",                     :default => 0,  :null => false
    t.integer  "autoreply",                    :default => 0,  :null => false
    t.integer  "unsubscribe",                  :default => 0,  :null => false
    t.datetime "admindate"
    t.integer  "adminby"
    t.text     "adminmessage",                                 :null => false
  end

  add_index "emails", ["account"], :name => "account"
  add_index "emails", ["admindate"], :name => "admindate"
  add_index "emails", ["autoreply"], :name => "autoreply"
  add_index "emails", ["customers_id"], :name => "customers_id"
  add_index "emails", ["date_sent"], :name => "date_sent"
  add_index "emails", ["likecust"], :name => "likecust"
  add_index "emails", ["ok"], :name => "ok"
  add_index "emails", ["postmaster"], :name => "postmaster"
  add_index "emails", ["spam"], :name => "spam"
  add_index "emails", ["uid"], :name => "uid"

  create_table "emails_attachments", :primary_key => "email_attachments_id", :force => true do |t|
    t.string "attachment_pathname", :default => "", :null => false
    t.string "mail_uid",            :default => "", :null => false
  end

  add_index "emails_attachments", ["mail_uid"], :name => "mail_uid"

  create_table "emails_html", :primary_key => "email_html_id", :force => true do |t|
    t.string "uid"
    t.text   "body"
  end

  add_index "emails_html", ["uid"], :name => "uid"

  create_table "emails_spam", :primary_key => "emails_spam_id", :force => true do |t|
    t.string "_from", :default => "", :null => false
  end

  create_table "emails_tocustomers", :primary_key => "emails_id", :force => true do |t|
    t.text     "_to"
    t.text     "subject"
    t.text     "body"
    t.datetime "date_sent"
    t.integer  "customers_id",     :default => 0, :null => false
    t.integer  "adminby"
    t.integer  "mail_opened",      :default => 0, :null => false
    t.datetime "mail_opened_date",                :null => false
  end

  add_index "emails_tocustomers", ["date_sent"], :name => "date_sent"

  create_table "emails_tocustomers_template", :id => false, :force => true do |t|
    t.integer "mail_messages_id",  :default => 0,  :null => false
    t.integer "language_id",       :default => 0,  :null => false
    t.string  "messages_subject",  :default => "", :null => false
    t.string  "messages_tag_name", :default => "", :null => false
    t.text    "messages_html",                     :null => false
  end

  create_table "extpost_name_zip", :id => false, :force => true do |t|
    t.integer "customers_id",                 :default => 0,  :null => false
    t.string  "customers_name",               :default => "", :null => false
    t.string  "zip",            :limit => 50, :default => "", :null => false
  end

  create_table "faqs", :force => true do |t|
    t.string   "name"
    t.integer  "nb_questions"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ordered"
  end

  create_table "feesharing", :primary_key => "feesahring_id", :force => true do |t|
    t.string   "feesharing_partner",  :limit => 50, :default => "", :null => false
    t.datetime "feesharing_date",                                   :null => false
    t.text     "feesahring_output",                                 :null => false
    t.integer  "feesahring_varprice",               :default => 0,  :null => false
  end

  create_table "feesharing_boomerang", :primary_key => "feesharing_boomerang_id", :force => true do |t|
    t.datetime "feesharing_date",                               :null => false
    t.string   "period",          :limit => 10, :default => "", :null => false
    t.integer  "products_id",                   :default => 0,  :null => false
    t.integer  "rentals",                       :default => 0,  :null => false
  end

  create_table "feesharing_envico", :primary_key => "feesharing_envico_id", :force => true do |t|
    t.datetime "feesharing_date",                :null => false
    t.integer  "products_id",     :default => 0, :null => false
    t.integer  "rentals",         :default => 0, :null => false
  end

  create_table "feesharing_envico_input", :primary_key => "products_id", :force => true do |t|
    t.string  "title_name", :default => "", :null => false
    t.string  "society",    :default => "", :null => false
    t.string  "envico_id",  :default => "", :null => false
    t.string  "fs_strat",   :default => "", :null => false
    t.integer "quantity",   :default => 0,  :null => false
  end

  add_index "feesharing_envico_input", ["envico_id"], :name => "envico_id", :unique => true

  create_table "feesharing_envico_outout", :primary_key => "feesharing_envico_outout_id", :force => true do |t|
    t.datetime "feesharing_date", :null => false
    t.text     "xml",             :null => false
  end

  create_table "feesharing_exceptions", :id => false, :force => true do |t|
    t.integer "products_id", :default => 0, :null => false
    t.integer "dvd_id",      :default => 0, :null => false
  end

  create_table "feesharing_melismedia", :primary_key => "feesharing_melismedia_id", :force => true do |t|
    t.datetime "feesharing_date",                               :null => false
    t.string   "period",          :limit => 10, :default => "", :null => false
    t.integer  "products_id",                   :default => 0,  :null => false
    t.integer  "rentals",                       :default => 0,  :null => false
  end

  create_table "feesharing_moviemax", :primary_key => "feesharing_boomerang_id", :force => true do |t|
    t.datetime "feesharing_date",                                      :null => false
    t.string   "period",                 :limit => 10, :default => "", :null => false
    t.integer  "products_id",                          :default => 0,  :null => false
    t.integer  "rentals",                              :default => 0,  :null => false
    t.integer  "rentals_in_first_month",               :default => 0,  :null => false
    t.integer  "rentals_after",                        :default => 0,  :null => false
  end

  create_table "feesharing_moviemax_id", :id => false, :force => true do |t|
    t.integer "titelnr",      :default => 0,  :null => false
    t.string  "title_name",   :default => "", :null => false
    t.string  "actor",        :default => "", :null => false
    t.integer "maatschappij", :default => 0,  :null => false
  end

  create_table "feesharing_moviemax_input", :primary_key => "products_id", :force => true do |t|
    t.string  "title_name",   :default => "", :null => false
    t.integer "titelnr",      :default => 0,  :null => false
    t.integer "maatschappij", :default => 0,  :null => false
  end

  create_table "feesharing_moviemax_leverancier", :force => true do |t|
    t.string  "leverancier", :default => "", :null => false
    t.integer "percentage",  :default => 0,  :null => false
  end

  create_table "feesharing_moviemax_output", :primary_key => "feesharing_moviemax_output_id", :force => true do |t|
    t.string "field1",  :limit => 4,  :default => "",                    :null => false
    t.string "field2",  :limit => 4,  :default => "",                    :null => false
    t.date   "date",                                                     :null => false
    t.time   "time",                  :default => '2000-01-01 00:00:00', :null => false
    t.string "titlenr", :limit => 7,  :default => "",                    :null => false
    t.string "field6",  :limit => 7,  :default => "",                    :null => false
    t.string "field7",  :limit => 1,  :default => "",                    :null => false
    t.string "field8",  :limit => 11, :default => "",                    :null => false
    t.string "field9",  :limit => 1,  :default => "",                    :null => false
  end

  create_table "feesharing_moviemax_output_20070126", :primary_key => "feesharing_moviemax_output_id", :force => true do |t|
    t.string "field1",  :limit => 4,  :default => "",                    :null => false
    t.string "field2",  :limit => 4,  :default => "",                    :null => false
    t.date   "date",                                                     :null => false
    t.time   "time",                  :default => '2000-01-01 00:00:00', :null => false
    t.string "titlenr", :limit => 5,  :default => "",                    :null => false
    t.string "field6",  :limit => 7,  :default => "",                    :null => false
    t.string "field7",  :limit => 1,  :default => "",                    :null => false
    t.string "field8",  :limit => 11, :default => "",                    :null => false
    t.string "field9",  :limit => 1,  :default => "",                    :null => false
  end

  create_table "feesharing_partner", :primary_key => "feesharing_partner_id", :force => true do |t|
    t.string "partner", :default => "", :null => false
    t.string "comment", :default => "", :null => false
  end

  create_table "feesharing_twinpics", :primary_key => "feesharing_melismedia_id", :force => true do |t|
    t.datetime "feesharing_date",                               :null => false
    t.string   "period",          :limit => 10, :default => "", :null => false
    t.integer  "products_id",                   :default => 0,  :null => false
    t.integer  "rentals",                       :default => 0,  :null => false
  end

  create_table "filters", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "country_id"
    t.integer  "audience_min"
    t.integer  "audience_max"
    t.integer  "rating_min"
    t.integer  "rating_max"
    t.integer  "year_min"
    t.integer  "year_max"
    t.text     "audio"
    t.text     "subtitles"
    t.text     "media"
    t.text     "recommended_ids"
    t.boolean  "dvdpost_choice"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "generalanalyze", :primary_key => "AnalyzeID", :force => true do |t|
    t.integer "UserID"
    t.integer "MenuID"
    t.string  "Name",             :limit => 50
    t.string  "Description",      :limit => 50
    t.boolean "ColGrandTotal"
    t.boolean "ColTotal"
    t.boolean "GrandTotalSingle"
    t.boolean "RowGrandTotal"
    t.boolean "RowTotal"
    t.boolean "TotalSingle"
  end

  create_table "generalanalyzefield", :id => false, :force => true do |t|
    t.integer "AnalyzeID",                        :default => 0,  :null => false
    t.string  "FieldName",          :limit => 50, :default => "", :null => false
    t.integer "Area"
    t.integer "TopValueCount"
    t.boolean "TopValueShowOthers"
    t.string  "FieldCaption",       :limit => 50
    t.boolean "BestFit"
    t.string  "SortBySummaryField", :limit => 50
    t.boolean "FieldVisible"
    t.integer "SummaryType"
    t.integer "SortOrder"
    t.integer "GroupIntervall"
  end

  create_table "generalbrowseview", :primary_key => "BrowseViewID", :force => true do |t|
    t.integer "UserID"
    t.integer "MenuID"
    t.string  "Name",         :limit => 50
    t.string  "Description",  :limit => 150
    t.integer "DefaultView"
    t.integer "WindowWidth"
    t.integer "WindowHeight"
    t.integer "SystemView"
  end

  add_index "generalbrowseview", ["UserID", "MenuID", "DefaultView"], :name => "IX_GeneralBrowseView_1"
  add_index "generalbrowseview", ["UserID", "MenuID", "Name"], :name => "IX_GeneralBrowseView", :unique => true

  create_table "generalbrowseviewcolumn", :id => false, :force => true do |t|
    t.integer "BrowseViewID",                 :default => 0,  :null => false
    t.string  "ViewName",      :limit => 50,  :default => "", :null => false
    t.string  "FieldName",     :limit => 150, :default => "", :null => false
    t.boolean "ToShow"
    t.integer "ColumnWidth"
    t.integer "OrderNbr"
    t.integer "RowIndex"
    t.integer "GroupSummary"
    t.integer "TotalSummary"
    t.string  "DataType",      :limit => 50
    t.string  "column_header", :limit => 90
  end

  create_table "generalbrowseviewgroupby", :id => false, :force => true do |t|
    t.integer "BrowseViewID",                :default => 0,  :null => false
    t.string  "ViewName",     :limit => 50,  :default => "", :null => false
    t.string  "FieldName",    :limit => 150, :default => "", :null => false
    t.integer "OrderNbr"
    t.boolean "ToGroup"
  end

  create_table "generalcomment", :id => false, :force => true do |t|
    t.integer  "EntityID",                          :default => 0,  :null => false
    t.string   "CommentRef",  :limit => 50,         :default => "", :null => false
    t.string   "Lang",        :limit => 2,          :default => "", :null => false
    t.integer  "Page",                              :default => 0,  :null => false
    t.string   "UserID",      :limit => 8,          :default => "", :null => false
    t.string   "Description", :limit => 50
    t.text     "Comment",     :limit => 2147483647
    t.datetime "InDate"
    t.string   "TableName",   :limit => 50
    t.string   "FieldName",   :limit => 50
    t.integer  "FieldID"
  end

  add_index "generalcomment", ["EntityID", "CommentRef", "TableName"], :name => "IX_CommentMaster"
  add_index "generalcomment", ["TableName", "FieldName", "FieldID"], :name => "IX_GeneralComment"

  create_table "generaldefaultset", :primary_key => "DefaultSetID", :force => true do |t|
    t.integer "UserID"
    t.integer "MenuID"
    t.string  "Name",             :limit => 50
    t.string  "Description",      :limit => 50
    t.integer "DefaultCriteria"
    t.integer "SystemCriteria"
    t.integer "TemplateCriteria"
  end

  add_index "generaldefaultset", ["UserID", "MenuID"], :name => "IX_GeneralRptCriteria"

  create_table "generaldefaultsetsub", :id => false, :force => true do |t|
    t.integer  "DefaultSetID",                  :default => 0,  :null => false
    t.string   "ControlName",     :limit => 50, :default => "", :null => false
    t.string   "ControlType",     :limit => 50
    t.string   "ControlProperty", :limit => 50
    t.string   "ValueType",       :limit => 50
    t.datetime "DateValue"
    t.boolean  "BoolValue"
    t.integer  "IntValue"
    t.float    "DblValue"
    t.string   "StringValue",     :limit => 50
  end

  create_table "generaldesctranslation", :id => false, :force => true do |t|
    t.string  "Lang",       :limit => 2,   :default => "", :null => false
    t.string  "Field",      :limit => 30,  :default => "", :null => false
    t.integer "FieldID",                   :default => 0,  :null => false
    t.string  "Translate1", :limit => 100
  end

  create_table "generalentity", :primary_key => "EntityID", :force => true do |t|
    t.string  "Name",          :limit => 50
    t.string  "Description",   :limit => 150
    t.string  "CurrCode",      :limit => 3
    t.string  "FormIcon",      :limit => 150
    t.integer "HoldingID"
    t.integer "AddrID"
    t.integer "ConsoEntityID"
    t.string  "CostTypeForGL", :limit => 3
    t.integer "OrderLocLevel"
  end

  add_index "generalentity", ["HoldingID"], :name => "IX_GeneralEntity"
  add_index "generalentity", ["Name"], :name => "IX_Entity", :unique => true

  create_table "generalfilter", :primary_key => "FilterID", :force => true do |t|
    t.string  "Name",          :limit => 50
    t.string  "UserID",        :limit => 10,  :default => "", :null => false
    t.integer "MenuID",                       :default => 0,  :null => false
    t.string  "Description",   :limit => 150
    t.boolean "DefaultFilter"
    t.integer "SystemFilter"
    t.integer "TopRows"
  end

  add_index "generalfilter", ["Name", "UserID", "MenuID"], :name => "IX_SecurityUserFilter", :unique => true
  add_index "generalfilter", ["UserID"], :name => "IX_GeneralFilter"

  create_table "generalfiltersub", :id => false, :force => true do |t|
    t.integer "FilterID",                          :default => 0,  :null => false
    t.integer "OrderNbr",                          :default => 0,  :null => false
    t.string  "FieldName",     :limit => 150,      :default => "", :null => false
    t.text    "FieldCriteria", :limit => 16777215
  end

  create_table "generalglobalcode", :id => false, :force => true do |t|
    t.string "CodeType",        :limit => 50,  :default => "", :null => false
    t.string "CodeValue",       :limit => 50,  :default => "", :null => false
    t.string "CodeDesc",        :limit => 150
    t.string "CodeDesc2",       :limit => 150
    t.string "ParentCodeType",  :limit => 50
    t.string "ParentCodeValue", :limit => 50
  end

  add_index "generalglobalcode", ["ParentCodeType", "ParentCodeValue"], :name => "IX_GeneralGlobalCode"

  create_table "generalglobalcodeint", :id => false, :force => true do |t|
    t.string  "CodeType",  :limit => 50, :default => "", :null => false
    t.integer "CodeValue",               :default => 0,  :null => false
    t.string  "CodeDesc",  :limit => 50
    t.string  "CodeDesc2", :limit => 50
  end

  create_table "generalglobalparameter", :id => false, :force => true do |t|
    t.string "SetupCategory", :limit => 50, :default => "", :null => false
    t.string "Name",          :limit => 50, :default => "", :null => false
    t.string "ParamValue",    :limit => 50
  end

  create_table "generalholding", :primary_key => "HoldingID", :force => true do |t|
    t.string "Name",        :limit => 50
    t.string "Description", :limit => 150
    t.string "CurrCode",    :limit => 3
  end

  add_index "generalholding", ["Name"], :name => "IX_GeneralHolding", :unique => true

  create_table "generalreport", :id => false, :force => true do |t|
    t.integer "ReportID",                     :default => 0, :null => false
    t.integer "MenuID"
    t.integer "UserID"
    t.string  "Name",          :limit => 150
    t.string  "Description",   :limit => 150
    t.string  "ReportPath",    :limit => 150
    t.integer "SystemReport"
    t.integer "DefaultReport"
    t.integer "ReportLang",                   :default => 0, :null => false
  end

  add_index "generalreport", ["Name", "ReportPath"], :name => "IX_GeneralReport_1", :unique => true
  add_index "generalreport", ["UserID", "MenuID", "Name"], :name => "IX_GeneralReport"

  create_table "geo_zones", :primary_key => "geo_zone_id", :force => true do |t|
    t.string   "geo_zone_name",        :limit => 32, :default => "", :null => false
    t.string   "geo_zone_description",               :default => "", :null => false
    t.datetime "last_modified"
    t.datetime "date_added",                                         :null => false
  end

  create_table "group_users", :force => true do |t|
    t.string  "group_id", :limit => 60, :null => false
    t.string  "login",    :limit => 60, :null => false
    t.string  "pass",     :limit => 40, :null => false
    t.integer "rights",                 :null => false
    t.string  "comment",  :limit => 50, :null => false
  end

  create_table "highlight_customers", :force => true do |t|
    t.integer "customer_id"
    t.integer "rank"
    t.integer "position"
    t.integer "day"
    t.string  "kind",          :limit => 0, :default => "MONTH"
    t.integer "ratings_count",              :default => 0,       :null => false
    t.integer "reviews_count",              :default => 0,       :null => false
  end

  create_table "highlight_products", :force => true do |t|
    t.integer "product_id"
    t.integer "rank"
    t.integer "position"
    t.integer "day"
    t.string  "kind",        :limit => 0, :default => "BEST", :null => false
    t.integer "language_id"
    t.integer "plus"
    t.integer "minder"
    t.float   "average",                  :default => 0.0,    :null => false
    t.integer "count",                    :default => 0,      :null => false
  end

  create_table "highlight_reviews", :force => true do |t|
    t.integer "review_id"
    t.integer "rank"
    t.integer "language_id"
  end

  create_table "historique_phone_activation", :primary_key => "hist_phone_activation_id", :force => true do |t|
    t.integer "customers_id",                                :null => false
    t.integer "stop_phone_id"
    t.string  "other_reason",                 :limit => 150
    t.date    "call_phone"
    t.string  "date_delete_phone_activation", :limit => 30
  end

  create_table "i18n_db_locales", :force => true do |t|
    t.string   "iso"
    t.string   "short"
    t.boolean  "main"
    t.datetime "updated_at"
  end

  add_index "i18n_db_locales", ["iso"], :name => "index_i18n_db_locales_on_iso"
  add_index "i18n_db_locales", ["short"], :name => "index_i18n_db_locales_on_short"

  create_table "i18n_db_translations", :force => true do |t|
    t.string   "tr_key"
    t.integer  "locale_id"
    t.text     "text"
    t.string   "namespace"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "i18n_db_translations", ["tr_key", "locale_id", "updated_at"], :name => "index_i18n_db_translations_on_tr_key_and_locale_id__updated_at"
  add_index "i18n_db_translations", ["tr_key", "locale_id"], :name => "index_i18n_db_translations_on_tr_key_and_locale_id"

  create_table "inventory", :primary_key => "inventory_id", :force => true do |t|
    t.datetime "date",                                        :null => false
    t.integer  "login_id",                  :default => 0,    :null => false
    t.integer  "box_id",                    :default => 0,    :null => false
    t.integer  "pibox_id",                  :default => 0,    :null => false
    t.integer  "products_id",               :default => 0,    :null => false
    t.integer  "dvd_id",                    :default => 0,    :null => false
    t.string   "comment",     :limit => 50, :default => "ok", :null => false
  end

  create_table "invoice", :primary_key => "invoice_id", :force => true do |t|
    t.datetime "invoice_date",                                                       :null => false
    t.integer  "abo_id",                                            :default => 0,   :null => false
    t.integer  "action",                                            :default => 0,   :null => false
    t.integer  "customers_id",                                      :default => 0,   :null => false
    t.string   "customers_name",                                    :default => "",  :null => false
    t.integer  "customers_language",                                :default => 0,   :null => false
    t.integer  "customers_site",                                    :default => 0,   :null => false
    t.integer  "orders_site",                                       :default => 0,   :null => false
    t.integer  "products_id",                                       :default => 0,   :null => false
    t.integer  "discount_code",                                     :default => 0,   :null => false
    t.integer  "activation_code",                                   :default => 0,   :null => false
    t.datetime "buy_date",                                                           :null => false
    t.datetime "valid_to_date",                                                      :null => false
    t.decimal  "amount",             :precision => 15, :scale => 2, :default => 0.0, :null => false
    t.string   "payment_method",                                    :default => "",  :null => false
    t.integer  "sent_to_customers",                                 :default => 0,   :null => false
    t.integer  "printed",                                           :default => 0,   :null => false
  end

  add_index "invoice", ["customers_id"], :name => "customers_id"

  create_table "ipg_action_history", :primary_key => "ipg_action_history_id", :force => true do |t|
    t.datetime "date",                        :null => false
    t.integer  "login",        :default => 0, :null => false
    t.integer  "context",      :default => 0, :null => false
    t.integer  "customers_id", :default => 0, :null => false
    t.integer  "action",       :default => 0, :null => false
  end

  create_table "ipg_context", :id => false, :force => true do |t|
    t.integer "context",         :default => 0,  :null => false
    t.string  "context_name",    :default => "", :null => false
    t.text    "context_comment",                 :null => false
  end

  create_table "ipg_context_action", :primary_key => "ipg_context_action_id", :force => true do |t|
    t.integer "context_id",          :default => 0,  :null => false
    t.integer "context_action_id",   :default => 0,  :null => false
    t.string  "context_action_name", :default => "", :null => false
  end

  create_table "ipg_leave", :primary_key => "ipg_leave_id", :force => true do |t|
    t.integer  "context",      :default => 0, :null => false
    t.datetime "date",                        :null => false
    t.integer  "login",        :default => 0, :null => false
    t.integer  "customers_id", :default => 0, :null => false
  end

  create_table "ipg_login", :primary_key => "login_id", :force => true do |t|
    t.string "login",    :default => "", :null => false
    t.string "password", :default => "", :null => false
    t.string "name",     :default => "", :null => false
  end

  add_index "ipg_login", ["login_id"], :name => "login_id"

  create_table "ipg_stat", :primary_key => "bo_stat_id", :force => true do |t|
    t.integer  "login_id",      :default => 0,  :null => false
    t.datetime "date",                          :null => false
    t.string   "path_info",     :default => "", :null => false
    t.string   "query_strings", :default => "", :null => false
  end

  add_index "ipg_stat", ["date"], :name => "date"
  add_index "ipg_stat", ["login_id"], :name => "login_id"

  create_table "landings", :force => true do |t|
    t.string  "name",           :limit => 100
    t.date    "expirated_date"
    t.string  "reference_id",   :limit => 20
    t.string  "actif_french",   :limit => 0,   :default => "YES",   :null => false
    t.string  "actif_dutch",    :limit => 0,   :default => "YES",   :null => false
    t.string  "actif_english",  :limit => 0,   :default => "YES",   :null => false
    t.string  "kind",           :limit => 0,   :default => "MOVIE", :null => false
    t.integer "ordered"
    t.string  "login",          :limit => 0,                        :null => false
  end

  create_table "languages", :primary_key => "languages_id", :force => true do |t|
    t.string  "name",       :limit => 32, :default => "", :null => false
    t.string  "code",       :limit => 2,  :default => "", :null => false
    t.string  "image",      :limit => 64
    t.string  "directory",  :limit => 32
    t.integer "sort_order"
  end

  add_index "languages", ["name"], :name => "IDX_LANGUAGES_NAME"

  create_table "languages_iso", :id => false, :force => true do |t|
    t.string "639_1", :limit => 2,  :null => false
    t.string "639_2", :limit => 3,  :null => false
    t.string "name",  :limit => 45, :null => false
  end

  create_table "lesoir_adress", :primary_key => "lesoir_adress_id", :force => true do |t|
    t.string  "firstname",      :limit => 50, :default => "", :null => false
    t.string  "lastname",       :limit => 50, :default => "", :null => false
    t.string  "street_address", :limit => 64, :default => "", :null => false
    t.string  "street_number",  :limit => 10, :default => "", :null => false
    t.string  "postcode",       :limit => 10, :default => "", :null => false
    t.string  "city",           :limit => 50, :default => "", :null => false
    t.string  "gender",         :limit => 1,  :default => "", :null => false
    t.string  "email_address",  :limit => 96, :default => "", :null => false
    t.integer "unsubscribe",                  :default => 0,  :null => false
  end

  add_index "lesoir_adress", ["email_address"], :name => "email_address", :unique => true

  create_table "listed_products", :force => true do |t|
    t.integer  "product_id"
    t.integer  "product_list_id"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "listed_products", ["product_id", "product_list_id"], :name => "index_listed_products_on_product_id_and_product_list_id"

  create_table "log_msgerror", :force => true do |t|
    t.string    "customers_id",  :limit => 45
    t.string    "processtype",   :limit => 0,  :null => false
    t.text      "msgerror",                    :null => false
    t.timestamp "date_added",                  :null => false
    t.integer   "user_modified",               :null => false
  end

  create_table "log_processout", :primary_key => "log_processout_id", :force => true do |t|
    t.datetime "startTime"
    t.datetime "endTime"
    t.integer  "dvd_total"
    t.integer  "dvd_expedited"
    t.integer  "dvd_skipped"
    t.integer  "dvd_notfound"
  end

  create_table "mail_messages", :id => false, :force => true do |t|
    t.integer "mail_messages_id",              :default => 0,      :null => false
    t.integer "language_id"
    t.string  "messages_subject"
    t.string  "messages_title"
    t.text    "messages_html"
    t.string  "comment",          :limit => 0, :default => "",     :null => false
    t.boolean "newsletter",                    :default => false
    t.boolean "viewable",                      :default => false
    t.string  "length",           :limit => 0, :default => "LONG"
    t.boolean "force_copy",                    :default => false
    t.integer "category_id"
    t.boolean "reminder",                      :default => false
  end

  create_table "mail_messages_copy", :id => false, :force => true do |t|
    t.integer "mail_messages_id", :default => 0,  :null => false
    t.integer "language_id",      :default => 0,  :null => false
    t.string  "messages_subject", :default => "", :null => false
    t.string  "messages_title",   :default => "", :null => false
    t.text    "messages_html",                    :null => false
    t.string  "comment",          :default => "", :null => false
    t.integer "newsletter",       :default => 0,  :null => false
    t.integer "viewable",         :default => 0,  :null => false
  end

  create_table "mail_messages_sent_history", :id => false, :force => true do |t|
    t.integer  "mail_messages_sent_history_id",                              :null => false
    t.datetime "date",                                                       :null => false
    t.integer  "customers_id",                                :default => 0, :null => false
    t.integer  "mail_messages_id",                            :default => 0, :null => false
    t.integer  "language_id",                                 :default => 0, :null => false
    t.integer  "mail_opened",                                 :default => 0, :null => false
    t.datetime "mail_opened_date"
    t.string   "customers_email_address",       :limit => 70
    t.text     "lstvariable"
  end

  add_index "mail_messages_sent_history", ["customers_id", "mail_messages_id"], :name => "cust_message"
  add_index "mail_messages_sent_history", ["date"], :name => "Idx_Date"

  create_table "mail_newsletter", :id => false, :force => true do |t|
    t.integer "mail_messages_id",                :default => 0,  :null => false
    t.integer "language_id",                     :default => 0,  :null => false
    t.string  "messages_subject",                :default => "", :null => false
    t.string  "messages_title",                  :default => "", :null => false
    t.text    "messages_html",                                   :null => false
    t.string  "comment",                         :default => "", :null => false
    t.string  "email_from",       :limit => 200, :default => "", :null => false
  end

  create_table "mail_param", :primary_key => "mail_param_id", :force => true do |t|
    t.integer "mail_messages_sent_temp_id",               :default => 0, :null => false
    t.string  "param_pk_name",              :limit => 64
    t.integer "param_pk_value"
  end

  add_index "mail_param", ["mail_messages_sent_temp_id", "param_pk_name"], :name => "mail_messages_sent_temp_id_2", :unique => true
  add_index "mail_param", ["mail_messages_sent_temp_id"], :name => "mail_messages_sent_temp_id"
  add_index "mail_param", ["param_pk_name"], :name => "param_pk_name"

  create_table "mail_webmaster", :id => false, :force => true do |t|
    t.string "Subject"
    t.text   "Body",               :limit => 16777215
    t.string "FromName"
    t.string "FromAddress"
    t.string "FromType"
    t.string "ToName"
    t.string "ToAddress"
    t.string "ToType"
    t.string "CCName"
    t.string "CCAddress"
    t.string "CCType"
    t.string "BCCName"
    t.string "BCCAddress"
    t.string "BCCType"
    t.string "BillingInformation"
    t.string "Categories"
    t.string "Importance"
    t.string "Mileage"
    t.string "Sensitivity"
  end

  create_table "mail_webmaster_to", :id => false, :force => true do |t|
    t.string "Subject"
    t.text   "Body",               :limit => 16777215
    t.string "FromName"
    t.string "FromAddress"
    t.string "FromType"
    t.string "ToName"
    t.string "ToAddress"
    t.string "ToType"
    t.string "CCName"
    t.string "CCAddress"
    t.string "CCType"
    t.string "BCCName"
    t.string "BCCAddress"
    t.string "BCCType"
    t.string "BillingInformation"
    t.string "Categories"
    t.string "Importance"
    t.string "Mileage"
    t.string "Sensitivity"
  end

  create_table "mailmanagement", :primary_key => "ID", :force => true do |t|
    t.string   "Email",        :limit => 50, :default => "", :null => false
    t.integer  "language",                   :default => 0,  :null => false
    t.datetime "SendDate",                                   :null => false
    t.integer  "Msg",                        :default => 0,  :null => false
    t.integer  "source",                     :default => 0,  :null => false
    t.integer  "Recieved"
    t.datetime "RecievedDate"
  end

  add_index "mailmanagement", ["ID"], :name => "ID"

  create_table "mailmanagement_source", :id => false, :force => true do |t|
    t.integer "mailmanagement_source_id", :default => 0,  :null => false
    t.string  "source_name",              :default => "", :null => false
  end

  create_table "mails", :force => true do |t|
    t.string   "name"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturers", :primary_key => "manufacturers_id", :force => true do |t|
    t.string   "manufacturers_name",  :limit => 32, :default => "", :null => false
    t.string   "manufacturers_image", :limit => 64
    t.datetime "date_added"
    t.datetime "last_modified"
  end

  add_index "manufacturers", ["manufacturers_name"], :name => "IDX_MANUFACTURERS_NAME"

  create_table "mem_get_mem", :primary_key => "mem_get_mem_id", :force => true do |t|
    t.integer  "customers_id",                   :default => 0,  :null => false
    t.datetime "date",                                           :null => false
    t.string   "email",            :limit => 75, :default => "", :null => false
    t.string   "firstname",        :limit => 32,                 :null => false
    t.string   "lastname",         :limit => 32,                 :null => false
    t.integer  "language",                       :default => 0,  :null => false
    t.integer  "mail_opened",                    :default => 0,  :null => false
    t.datetime "mail_opened_date"
    t.integer  "unsubscribe",                    :default => 0,  :null => false
  end

  create_table "mem_get_mem_gift", :primary_key => "mem_get_mem_gift_id", :force => true do |t|
    t.integer "products_id",                 :default => 0,      :null => false
    t.string  "gift_name_fr",                :default => "",     :null => false
    t.string  "gift_name_nl",                :default => "",     :null => false
    t.string  "gift_name_en",                :default => "",     :null => false
    t.integer "points",                      :default => 0,      :null => false
    t.integer "quantity",                    :default => 0,      :null => false
    t.integer "status",                      :default => 0,      :null => false
    t.string  "EntityID_list", :limit => 50, :default => "1,38", :null => false
  end

  create_table "mem_get_mem_gift_history", :primary_key => "mem_get_mem_gift_history_id", :force => true do |t|
    t.integer  "customers_id",   :default => 0, :null => false
    t.datetime "date",                          :null => false
    t.integer  "gift_id",        :default => 0, :null => false
    t.integer  "points",         :default => 0, :null => false
    t.integer  "gift_sent",      :default => 0, :null => false
    t.datetime "gift_sent_date"
  end

  create_table "mem_get_mem_used", :primary_key => "mem_get_mem_used_id", :force => true do |t|
    t.datetime "date",                             :null => false
    t.integer  "father_id",       :default => 0,   :null => false
    t.integer  "father_abo_type", :default => 0,   :null => false
    t.integer  "son_id",          :default => 0,   :null => false
    t.integer  "son_abo_type",    :default => 0,   :null => false
    t.integer  "points",          :default => 0,   :null => false
    t.integer  "expected_points", :default => 200
  end

  create_table "message_tickets", :force => true do |t|
    t.integer  "user_id"
    t.integer  "mail_id"
    t.integer  "ticket_id"
    t.text     "data"
    t.boolean  "is_read",         :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mail_history_id"
  end

  add_index "message_tickets", ["is_read"], :name => "is_read"
  add_index "message_tickets", ["ticket_id"], :name => "ticket_id"
  add_index "message_tickets", ["user_id"], :name => "user_id"

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.string   "filename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletter_dynamic", :id => false, :force => true do |t|
    t.integer "newsletter_dynamic_id",                :default => 0,  :null => false
    t.integer "language_id",                          :default => 0,  :null => false
    t.string  "focus_image",           :limit => 100, :default => "", :null => false
    t.string  "focus_image_big",       :limit => 100, :default => "", :null => false
    t.text    "focus_explain",                                        :null => false
    t.integer "focus_products_id",                    :default => 0,  :null => false
    t.string  "news_dvd1_image",       :limit => 100, :default => "", :null => false
    t.integer "news_dvd1_products_id",                :default => 0,  :null => false
    t.string  "news_dvd2_image",       :limit => 100, :default => "", :null => false
    t.integer "news_dvd2_products_id",                :default => 0,  :null => false
    t.string  "news_dvd3_image",       :limit => 100, :default => "", :null => false
    t.integer "news_dvd3_products_id",                :default => 0,  :null => false
    t.string  "messages_subject",                     :default => "", :null => false
    t.integer "newsletter_validated",                 :default => 0,  :null => false
    t.integer "newsletter_visible",                   :default => 0,  :null => false
  end

  create_table "newsletters", :primary_key => "newsletters_id", :force => true do |t|
    t.string   "title",      :default => "", :null => false
    t.text     "content",                    :null => false
    t.string   "module",     :default => "", :null => false
    t.datetime "date_added",                 :null => false
    t.datetime "date_sent"
    t.integer  "status"
    t.integer  "locked",     :default => 0
  end

  create_table "newsletters_unsubscribe_history", :primary_key => "newsletters_unsubscribe_history_id", :force => true do |t|
    t.integer  "customers_id", :default => 0, :null => false
    t.datetime "date",                        :null => false
  end

  create_table "ogone_batch", :primary_key => "ogone_batch_id", :force => true do |t|
    t.datetime "ogone_batch_date",   :null => false
    t.text     "ogone_batch_output", :null => false
    t.text     "ogone_batch_result"
  end

  create_table "ogone_check", :force => true do |t|
    t.string    "orderid",            :limit => 50, :default => "0", :null => false
    t.integer   "amount",                           :default => 0,   :null => false
    t.integer   "customers_id",                     :default => 0,   :null => false
    t.string    "context",                          :default => "",  :null => false
    t.integer   "products_id",                      :default => 0,   :null => false
    t.integer   "discount_code_id",                 :default => 0,   :null => false
    t.integer   "activation_code_id",               :default => 0,   :null => false
    t.integer   "gift_duration",                    :default => 0,   :null => false
    t.string    "gift_firstname",                   :default => "",  :null => false
    t.string    "gift_lastname",                    :default => "",  :null => false
    t.text      "gift_message",                                      :null => false
    t.string    "sponsoring_email",                 :default => "",  :null => false
    t.string    "belgiqueloisirs_id",               :default => "",  :null => false
    t.integer   "site",                             :default => 0,   :null => false
    t.timestamp "created_at"
  end

  add_index "ogone_check", ["id", "customers_id"], :name => "customers_actions"

  create_table "ogone_payment", :primary_key => "ogone_payment_id", :force => true do |t|
    t.datetime "date_added"
    t.integer  "abo_id",                                                            :default => 0,   :null => false
    t.integer  "customers_id",                                                      :default => 0,   :null => false
    t.decimal  "amount",                             :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.integer  "ogone_payment_status",                                              :default => 0,   :null => false
    t.string   "ogone_batch_id",       :limit => 10
    t.datetime "last_modified"
    t.integer  "account_movements_id"
    t.decimal  "amount_remaining",                   :precision => 10, :scale => 2
    t.integer  "payment_status"
  end

  add_index "ogone_payment", ["abo_id"], :name => "abo_id"
  add_index "ogone_payment", ["customers_id"], :name => "customers_id"
  add_index "ogone_payment", ["ogone_batch_id"], :name => "batch_id"

  create_table "ogone_payment_status", :force => true do |t|
    t.string "name",        :limit => 32
    t.string "description", :limit => 128
  end

  create_table "ogone_payment_status_history", :primary_key => "ogone_payment_status_history_id", :force => true do |t|
    t.integer  "ogone_payment_id"
    t.integer  "new_status"
    t.integer  "old_status"
    t.datetime "date_added"
  end

  add_index "ogone_payment_status_history", ["ogone_payment_id"], :name => "ogone_payment_id"

  create_table "old_payment_offline_status", :force => true do |t|
    t.string  "name",        :limit => 50
    t.string  "description", :limit => 128
    t.integer "orderStep"
    t.string  "TypeStatus",  :limit => 0
  end

  create_table "old_payment_status_history", :primary_key => "payment_status_history_id", :force => true do |t|
    t.integer  "payment_id"
    t.integer  "new_status"
    t.integer  "old_status"
    t.datetime "date_added"
  end

  add_index "old_payment_status_history", ["payment_id"], :name => "payment_id"

  create_table "orders", :primary_key => "orders_id", :force => true do |t|
    t.integer  "customers_id",                                                             :default => 0,  :null => false
    t.string   "customers_name",              :limit => 64,                                :default => "", :null => false
    t.string   "customers_street_address",    :limit => 64,                                :default => "", :null => false
    t.string   "customers_suburb",            :limit => 32
    t.string   "customers_city",              :limit => 32,                                :default => "", :null => false
    t.string   "customers_postcode",          :limit => 10,                                :default => "", :null => false
    t.string   "customers_state",             :limit => 32
    t.string   "customers_country",           :limit => 32,                                :default => "", :null => false
    t.string   "customers_telephone",         :limit => 32,                                :default => "", :null => false
    t.string   "customers_email_address",     :limit => 96,                                :default => "", :null => false
    t.integer  "customers_address_format_id",                                              :default => 0,  :null => false
    t.string   "delivery_name",               :limit => 64,                                :default => "", :null => false
    t.string   "delivery_street_address",     :limit => 64,                                :default => "", :null => false
    t.string   "delivery_suburb",             :limit => 32
    t.string   "delivery_city",               :limit => 32,                                :default => "", :null => false
    t.string   "delivery_postcode",           :limit => 10,                                :default => "", :null => false
    t.string   "delivery_state",              :limit => 32
    t.string   "delivery_country",            :limit => 32,                                :default => "", :null => false
    t.integer  "delivery_address_format_id",                                               :default => 0,  :null => false
    t.string   "payment_method",              :limit => 32,                                :default => "", :null => false
    t.string   "cc_type",                     :limit => 20
    t.string   "cc_owner",                    :limit => 64
    t.string   "cc_number",                   :limit => 32
    t.string   "cc_expires",                  :limit => 4
    t.datetime "last_modified"
    t.datetime "date_purchased"
    t.integer  "orders_status",                                                            :default => 0,  :null => false
    t.datetime "orders_date_finished"
    t.text     "comments"
    t.string   "currency",                    :limit => 3
    t.decimal  "currency_value",                            :precision => 14, :scale => 6
    t.integer  "site",                                                                     :default => 1,  :null => false
    t.integer  "secured_mail",                                                             :default => 0,  :null => false
    t.string   "multishipment_sm",            :limit => 1
    t.integer  "products_id"
    t.string   "orders_type",                 :limit => 0
    t.integer  "user_modified"
  end

  add_index "orders", ["customers_id"], :name => "customers_id"
  add_index "orders", ["date_purchased"], :name => "date_purchased"
  add_index "orders", ["delivery_postcode"], :name => "delivery_postcode"
  add_index "orders", ["orders_status"], :name => "orders_status"
  add_index "orders", ["orders_status"], :name => "orders_status_2"

  create_table "orders_canceled", :primary_key => "orders_canceled_id", :force => true do |t|
    t.integer   "orders_id",                    :null => false
    t.integer   "customers_id",                 :null => false
    t.integer   "products_id",                  :null => false
    t.integer   "products_dvd_id",              :null => false
    t.timestamp "date_added",                   :null => false
    t.datetime  "last_modified",                :null => false
    t.integer   "user_modified",                :null => false
    t.integer   "box_id",                       :null => false
    t.integer   "pos",                          :null => false
    t.string    "orders_type",     :limit => 0, :null => false
    t.integer   "orders_status",                :null => false
  end

  create_table "orders_checked", :primary_key => "orders_id", :force => true do |t|
    t.datetime "orders_checked_date",                   :null => false
    t.integer  "orders_checked_adminby", :default => 0, :null => false
  end

  create_table "orders_products", :primary_key => "orders_products_id", :force => true do |t|
    t.integer "orders_id",                                                           :default => 0,   :null => false
    t.integer "products_id",                                                         :default => 0,   :null => false
    t.string  "products_model",         :limit => 12
    t.string  "products_name",          :limit => 64,                                :default => "",  :null => false
    t.decimal "products_price",                       :precision => 15, :scale => 4, :default => 0.0, :null => false
    t.decimal "final_price",                          :precision => 15, :scale => 4, :default => 0.0, :null => false
    t.decimal "products_tax",                         :precision => 7,  :scale => 4, :default => 0.0, :null => false
    t.integer "products_quantity",                                                   :default => 0,   :null => false
    t.integer "products_dvd",                                                        :default => 0,   :null => false
    t.integer "orders_products_status",                                              :default => 0,   :null => false
    t.integer "feesharing",                                                          :default => 0,   :null => false
    t.string  "orders_products_type",   :limit => 45
    t.string  "pick_group",             :limit => 45
    t.integer "pick_boxid"
  end

  add_index "orders_products", ["orders_id", "orders_products_type"], :name => "order_type"
  add_index "orders_products", ["orders_id"], :name => "orders_id"
  add_index "orders_products", ["orders_products_status", "products_id"], :name => "Status_Products_ID"
  add_index "orders_products", ["products_dvd"], :name => "products_dvd"
  add_index "orders_products", ["products_id", "orders_products_id"], :name => "Index_5"
  add_index "orders_products", ["products_id", "orders_products_type"], :name => "product_type"
  add_index "orders_products", ["products_id"], :name => "products_id"

  create_table "orders_products_feesharing_status", :id => false, :force => true do |t|
    t.integer "orders_products_feesharing_status_id", :default => 0,  :null => false
    t.string  "name",                                 :default => "", :null => false
  end

  create_table "orders_products_status", :id => false, :force => true do |t|
    t.integer "orders_products_status_id",                 :default => 0,  :null => false
    t.integer "language_id",                               :default => 1,  :null => false
    t.string  "orders_products_status_name", :limit => 32, :default => "", :null => false
  end

  add_index "orders_products_status", ["orders_products_status_name"], :name => "idx_orders_status_name"

  create_table "orders_status", :id => false, :force => true do |t|
    t.integer "orders_status_id",                 :default => 0,  :null => false
    t.integer "language_id",                      :default => 1,  :null => false
    t.string  "orders_status_name", :limit => 32, :default => "", :null => false
  end

  add_index "orders_status", ["orders_status_name"], :name => "idx_orders_status_name"

  create_table "orders_status_history", :primary_key => "orders_status_history_id", :force => true do |t|
    t.integer  "orders_id",         :default => 0, :null => false
    t.integer  "new_value",         :default => 0, :null => false
    t.integer  "old_value"
    t.datetime "date_added",                       :null => false
    t.integer  "customer_notified", :default => 0
  end

  add_index "orders_status_history", ["customer_notified"], :name => "notif"
  add_index "orders_status_history", ["new_value"], :name => "new_value"
  add_index "orders_status_history", ["orders_id"], :name => "orders_id"

  create_table "orders_status_new", :force => true do |t|
    t.string "name", :limit => 45, :null => false
  end

  create_table "partners", :force => true do |t|
    t.string   "name"
    t.string   "logo"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "language"
    t.integer  "forced_position"
  end

  create_table "payment", :id => false, :force => true do |t|
    t.integer  "id",                                                                               :null => false
    t.integer  "payment_method",                                                                   :null => false
    t.datetime "date_added",                                                                       :null => false
    t.integer  "customers_id",                                                                     :null => false
    t.integer  "abo_id"
    t.decimal  "amount",                             :precision => 10, :scale => 2,                :null => false
    t.integer  "payment_status",                                                                   :null => false
    t.integer  "batch_id"
    t.datetime "last_modified",                                                                    :null => false
    t.string   "domiciliation_number", :limit => 45
    t.string   "communication",        :limit => 45
    t.integer  "user_modified"
    t.datetime "date_closed"
    t.integer  "last_status_id"
    t.integer  "account_movements_id"
    t.integer  "payment_type_id",                                                   :default => 1
  end

  add_index "payment", ["batch_id"], :name => "batch_id"
  add_index "payment", ["customers_id"], :name => "customers_id"
  add_index "payment", ["payment_method"], :name => "payment_method"
  add_index "payment", ["payment_status"], :name => "payment_status"

  create_table "payment2", :id => false, :force => true do |t|
    t.integer  "id",                                                                :null => false
    t.integer  "payment_method",                                                    :null => false
    t.datetime "date_added",                                                        :null => false
    t.integer  "customers_id",                                                      :null => false
    t.integer  "abo_id"
    t.decimal  "amount",                             :precision => 10, :scale => 2, :null => false
    t.integer  "payment_status",                                                    :null => false
    t.integer  "batch_id"
    t.datetime "last_modified",                                                     :null => false
    t.string   "domiciliation_number", :limit => 45
    t.string   "communication",        :limit => 45
    t.integer  "user_modified"
    t.datetime "date_closed"
    t.integer  "last_status_id"
    t.integer  "account_movements_id"
  end

  add_index "payment2", ["batch_id"], :name => "batch_id"
  add_index "payment2", ["customers_id"], :name => "customers_id"
  add_index "payment2", ["payment_method"], :name => "payment_method"
  add_index "payment2", ["payment_status"], :name => "payment_status"

  create_table "payment_batch", :primary_key => "batch_id", :force => true do |t|
    t.integer  "payment_method"
    t.string   "batch_number",   :limit => 45
    t.text     "batch_output"
    t.datetime "batch_date"
    t.integer  "EntityID"
  end

  add_index "payment_batch", ["payment_method", "batch_number"], :name => "paymentmethod_batchNumber"

  create_table "payment_offline_request", :primary_key => "payment_offline_request_id", :force => true do |t|
    t.float    "amount",                   :limit => 10
    t.string   "dvdpost_bank_account",     :limit => 12
    t.string   "communication",            :limit => 12,                 :null => false
    t.integer  "customers_id"
    t.datetime "date_added"
    t.integer  "payment_offline_status"
    t.datetime "last_modified"
    t.string   "comment",                  :limit => 128
    t.integer  "domiciliation_payment_id"
    t.integer  "ogone_payment_id"
    t.integer  "account_movements_id"
    t.datetime "date_closed"
    t.datetime "date_closed_eurofides"
    t.string   "reason_pk_name",           :limit => 64
    t.integer  "reason_pk_value"
    t.float    "amount_received",          :limit => 10
    t.integer  "banktransfert_payment_id"
    t.integer  "user_modified"
    t.integer  "payment_status",                          :default => 9, :null => false
    t.datetime "date_reconduction"
  end

  add_index "payment_offline_request", ["communication"], :name => "communication"
  add_index "payment_offline_request", ["customers_id"], :name => "customers_id"
  add_index "payment_offline_request", ["domiciliation_payment_id"], :name => "domiciliation_payment_id"
  add_index "payment_offline_request", ["ogone_payment_id"], :name => "ogone_payment_id"
  add_index "payment_offline_request", ["payment_status"], :name => "Indx_Status"
  add_index "payment_offline_request", ["reason_pk_name", "reason_pk_value"], :name => "Index_OfflinePayment"
  add_index "payment_offline_request", ["reason_pk_name", "reason_pk_value"], :name => "keypayment", :unique => true

  create_table "payment_offline_request_status_history", :primary_key => "payment_offline_request_status_history_id", :force => true do |t|
    t.integer  "payment_offline_request_id"
    t.integer  "new_status"
    t.integer  "old_status"
    t.datetime "date_added"
  end

  add_index "payment_offline_request_status_history", ["payment_offline_request_id"], :name => "payment_offline_request_id"

  create_table "payment_status", :force => true do |t|
    t.string  "name",        :limit => 45
    t.string  "description", :limit => 45
    t.integer "OrderStep",                 :default => 0, :null => false
  end

  create_table "payment_type", :force => true do |t|
    t.string "name", :limit => 45, :null => false
  end

  create_table "phone_custserv", :force => true do |t|
    t.integer  "customer_id",                              :null => false
    t.integer  "reason",                                   :null => false
    t.integer  "hour",                                     :null => false
    t.date     "day",                                      :null => false
    t.string   "comment",     :limit => 45
    t.integer  "open",                      :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone",       :limit => 20
    t.integer  "language_id"
  end

  create_table "phone_request", :force => true do |t|
    t.string  "name",           :limit => 80
    t.string  "phone",          :limit => 80
    t.integer "customers_id",                  :default => 0
    t.integer "language_id",                   :default => 1
    t.integer "call_me_day",                   :default => 0
    t.integer "call_me_hour",                  :default => 0
    t.integer "call_me_reason",                :default => 0
    t.integer "entity_id",                     :default => 0
    t.integer "call_answerd",                  :default => 0
    t.string  "call_comment",   :limit => 120
  end

  create_table "picture_format", :id => false, :force => true do |t|
    t.integer "picture_format_id",                 :default => 0,  :null => false
    t.integer "language_id",                       :default => 0,  :null => false
    t.string  "picture_format_name", :limit => 50, :default => "", :null => false
  end

  create_table "pizzahut_reconduction", :primary_key => "pizzahut_reconduction_id", :force => true do |t|
    t.datetime "date",                        :null => false
    t.integer  "customers_id", :default => 0, :null => false
  end

  create_table "post_redbox", :id => false, :force => true do |t|
    t.integer "post_redbox_id",                   :default => 0,  :null => false
    t.string  "post_code",          :limit => 10, :default => "", :null => false
    t.string  "post_code_physical", :limit => 10, :default => "", :null => false
    t.string  "city",               :limit => 64, :default => "", :null => false
    t.string  "street_address",                   :default => "", :null => false
    t.string  "street_number",      :limit => 10, :default => "", :null => false
    t.string  "collect_platform",                 :default => "", :null => false
  end

  add_index "post_redbox", ["post_redbox_id"], :name => "post_redbox_id"

  create_table "post_redbox2", :id => false, :force => true do |t|
    t.integer "post_redbox_id",                            :default => 0,  :null => false
    t.string  "post_code",                   :limit => 10, :default => "", :null => false
    t.string  "post_code_physical",          :limit => 10, :default => "", :null => false
    t.string  "city",                        :limit => 64, :default => "", :null => false
    t.string  "street_address",                            :default => "", :null => false
    t.string  "street_number",               :limit => 10, :default => "", :null => false
    t.string  "N_DE_SERVICE_1IERE_LEVEE_LM",               :default => "", :null => false
    t.string  "N_COURSE_1IERE",                            :default => "", :null => false
    t.string  "collect_platform",                          :default => "", :null => false
  end

  create_table "product_lists", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "home_page",                   :default => false,    :null => false
    t.boolean  "status",                      :default => false,    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind",           :limit => 0
    t.string   "restriction",    :limit => 0, :default => "NORMAL", :null => false
    t.integer  "language",                    :default => 1,        :null => false
    t.string   "style",          :limit => 0, :default => "DVD",    :null => false
    t.integer  "theme_event_id"
  end

  create_table "product_views", :force => true do |t|
    t.integer  "product_id"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_views", ["product_id"], :name => "index_products_views_on_product_id"

  create_table "products", :primary_key => "products_id", :force => true do |t|
    t.string   "products_type",                      :limit => 10,                                 :default => "DVD_NORM"
    t.integer  "products_quantity",                                                                :default => 1,          :null => false
    t.string   "products_model",                     :limit => 50
    t.integer  "imdb_id",                                                                          :default => 0,          :null => false
    t.string   "products_title",                                                                   :default => "",         :null => false
    t.string   "products_image",                     :limit => 64,                                 :default => "dvd/"
    t.decimal  "products_price",                                    :precision => 5,  :scale => 2, :default => 4.0,        :null => false
    t.datetime "products_date_added",                                                                                      :null => false
    t.datetime "products_last_modified"
    t.datetime "cached_at"
    t.datetime "products_date_available"
    t.integer  "products_weight",                                                                  :default => 0
    t.integer  "products_status",                                                                  :default => 1,          :null => false
    t.integer  "products_tax_class_id",                                                            :default => 0,          :null => false
    t.integer  "manufacturers_id"
    t.integer  "products_ordered",                                                                 :default => 0,          :null => false
    t.integer  "products_public",                                                                  :default => 0
    t.integer  "products_runtime"
    t.integer  "products_year"
    t.integer  "products_countries_id",                                                            :default => 0,          :null => false
    t.integer  "products_picture_format"
    t.integer  "products_rating"
    t.integer  "products_directors_id"
    t.integer  "products_regional_code",                                                           :default => 2
    t.integer  "products_studio"
    t.integer  "products_barcode",                                                                 :default => 0,          :null => false
    t.integer  "products_dvd_quantity",                                                            :default => 1,          :null => false
    t.integer  "products_language_fr",                                                             :default => 0,          :null => false
    t.integer  "products_undertitle_nl",                                                           :default => 0,          :null => false
    t.integer  "in_the_bags",                                                                      :default => 0,          :null => false
    t.integer  "in_the_bags_next",                                                                 :default => 0,          :null => false
    t.integer  "in_cinema_now",                                                                    :default => 0,          :null => false
    t.integer  "products_dvdpostchoice",                                                           :default => 0,          :null => false
    t.integer  "products_other_language"
    t.integer  "products_french",                                                                  :default => 0,          :null => false
    t.integer  "products_next",                                                                    :default => 0,          :null => false
    t.boolean  "vod_next",                                                                         :default => false
    t.integer  "products_tiscali_hp_fr",                                                           :default => 0,          :null => false
    t.integer  "products_tiscali_hp_nl",                                                           :default => 0,          :null => false
    t.integer  "products_series_id",                                                               :default => 0,          :null => false
    t.integer  "products_series_number",                                                           :default => 0,          :null => false
    t.integer  "products_series_aboprocess_id",                                                    :default => 0,          :null => false
    t.integer  "products_series_aboprocess_number",                                                :default => 0,          :null => false
    t.integer  "cinebel_id"
    t.integer  "cinebel_trailer"
    t.integer  "feesharing",                                                                       :default => 0,          :null => false
    t.date     "feesharing_end"
    t.decimal  "feesharing_upfront_fee",                            :precision => 4,  :scale => 2, :default => 0.0,        :null => false
    t.integer  "feesharing_upfront_fee_recoverable",                                               :default => 0,          :null => false
    t.decimal  "feesharing_turn_price",                             :precision => 4,  :scale => 2, :default => 0.0,        :null => false
    t.decimal  "feesharing_turn_price_after3month",                 :precision => 4,  :scale => 2, :default => 0.0,        :null => false
    t.decimal  "feesharing_buy_option_price",                       :precision => 4,  :scale => 2, :default => 0.0,        :null => false
    t.integer  "feesharing_expected_nbr_turns",                                                    :default => 0,          :null => false
    t.integer  "products_desire",                                                                  :default => 0,          :null => false
    t.decimal  "products_desire_weighted",                          :precision => 15, :scale => 2, :default => 0.0,        :null => false
    t.integer  "products_availability",                                                            :default => 3,          :null => false
    t.integer  "quantity_to_sale",                                                                 :default => 0,          :null => false
    t.decimal  "products_sale_price",                               :precision => 5,  :scale => 2, :default => 0.0,        :null => false
    t.datetime "products_sale_date"
    t.integer  "distributors_id",                                                                  :default => 0,          :null => false
    t.integer  "quantity_new_to_sale",                                                             :default => 0,          :null => false
    t.decimal  "products_new_sale_price",                           :precision => 5,  :scale => 2, :default => 0.0,        :null => false
    t.integer  "only_for_sale",                                                                    :default => 0,          :null => false
    t.string   "products_media",                     :limit => 45,                                 :default => "DVD",      :null => false
    t.string   "products_product_type",              :limit => 45,                                 :default => "Movie",    :null => false
    t.integer  "game_nbr_of_players",                                                              :default => 0
    t.integer  "game_nbr_of_players_online",                                                       :default => 0
    t.string   "game_config_mini",                   :limit => 250
    t.integer  "game_online",                                                                      :default => 0
    t.integer  "criteo_status",                                                                    :default => 0,          :null => false
    t.integer  "rating_users",                                                                     :default => 0,          :null => false
    t.integer  "rating_count",                                                                     :default => 0,          :null => false
    t.datetime "date_disabled"
    t.integer  "imdb_id_serie"
  end

  add_index "products", ["imdb_id"], :name => "imdb_products_index"
  add_index "products", ["imdb_id_serie"], :name => "imdb_serie"
  add_index "products", ["in_cinema_now"], :name => "cinema"
  add_index "products", ["products_availability"], :name => "products_availability"
  add_index "products", ["products_date_added"], :name => "idx_products_date_added"
  add_index "products", ["products_directors_id"], :name => "products_directors_id"
  add_index "products", ["products_dvdpostchoice"], :name => "awards"
  add_index "products", ["products_id"], :name => "idx_products"
  add_index "products", ["products_next"], :name => "next"
  add_index "products", ["products_rating"], :name => "rating"
  add_index "products", ["products_series_aboprocess_id"], :name => "products_series_aboprocess_id"
  add_index "products", ["products_series_id"], :name => "products_series_id"
  add_index "products", ["products_status"], :name => "products_status"
  add_index "products", ["products_title"], :name => "products_title"
  add_index "products", ["products_type"], :name => "idx_products_type"
  add_index "products", ["products_type"], :name => "product_type"

  create_table "products_abo", :primary_key => "products_id", :force => true do |t|
    t.integer "qty_at_home",                          :default => 0,   :null => false
    t.integer "qty_credit",                           :default => 0,   :null => false
    t.integer "qty_dvd_max",                          :default => 0
    t.integer "overwrite_credit",                     :default => 0,   :null => false
    t.string  "allowed_public_entity",  :limit => 50, :default => "",  :null => false
    t.string  "allowed_private_entity", :limit => 50, :default => "",  :null => false
    t.string  "popular_entity",         :limit => 50, :default => "0", :null => false
    t.string  "most_popular_entity",    :limit => 50, :default => "0", :null => false
    t.string  "allowed_public_group",   :limit => 25, :default => "",  :null => false
    t.string  "allowed_private_group",  :limit => 25, :default => "",  :null => false
    t.string  "popular_group",          :limit => 25, :default => "0", :null => false
    t.string  "most_popular_group",     :limit => 25, :default => "0", :null => false
    t.integer "ordered",                              :default => 0
  end

  create_table "products_alert", :primary_key => "alert_id", :force => true do |t|
    t.integer  "products_id",     :default => 0, :null => false
    t.integer  "products_dvd_id", :default => 0, :null => false
    t.datetime "alert_cre_date",                 :null => false
    t.text     "alert_comment",                  :null => false
    t.integer  "user_modified",                  :null => false
    t.boolean  "check_status",                   :null => false
  end

  create_table "products_availability", :primary_key => "products_id", :force => true do |t|
    t.float    "ratio",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products_countries", :primary_key => "countries_id", :force => true do |t|
    t.string  "countries_name", :limit => 64, :default => "", :null => false
    t.integer "inprod",                       :default => 0,  :null => false
  end

  add_index "products_countries", ["countries_name"], :name => "IDX_COUNTRIES_NAME"

  create_table "products_cover", :id => false, :force => true do |t|
    t.integer "products_id",  :default => 0, :null => false
    t.integer "cover_box_id", :default => 0, :null => false
    t.integer "qty"
  end

  create_table "products_description", :id => false, :force => true do |t|
    t.integer "products_id",                        :default => 0,  :null => false
    t.integer "language_id",                        :default => 1,  :null => false
    t.string  "products_name",        :limit => 64, :default => "", :null => false
    t.text    "products_description"
    t.text    "products_bonus",                                     :null => false
    t.string  "products_url"
    t.text    "products_awards",                                    :null => false
    t.integer "products_viewed",                    :default => 0
    t.string  "products_image_big",   :limit => 50, :default => "", :null => false
    t.string  "cached_name"
  end

  add_index "products_description", ["language_id"], :name => "language_id"
  add_index "products_description", ["products_id"], :name => "products_id"
  add_index "products_description", ["products_name"], :name => "products_name"

  create_table "products_dvd", :id => false, :force => true do |t|
    t.integer  "products_id",                                 :default => 0,   :null => false
    t.integer  "products_dvdid",                              :default => 0,   :null => false
    t.integer  "EntityID",                                    :default => 1,   :null => false
    t.integer  "products_dvd_status",                         :default => 1,   :null => false
    t.integer  "inout",                                       :default => 1,   :null => false
    t.datetime "dvd_buy_date"
    t.date     "date_lastrented"
    t.integer  "nbr_rotation_in_feesharing",                  :default => 0,   :null => false
    t.integer  "box_id",                                      :default => 0,   :null => false
    t.integer  "pibox_id",                                    :default => 0,   :null => false
    t.integer  "last_adminby",                  :limit => 8,  :default => 0,   :null => false
    t.datetime "last_admindate"
    t.integer  "preattribute_orders_id",                      :default => 0,   :null => false
    t.string   "cover_box_id",                  :limit => 10
    t.integer  "shelves_id",                                  :default => 0,   :null => false
    t.integer  "row_id",                                      :default => 0,   :null => false
    t.integer  "column_id",                                   :default => 0,   :null => false
    t.string   "stock_type",                    :limit => 10, :default => "D"
    t.integer  "nbr_rotation",                                :default => 0,   :null => false
    t.integer  "nbr_rotation_since_last_check",               :default => 0,   :null => false
    t.integer  "nbr_repair"
  end

  add_index "products_dvd", ["box_id"], :name => "box_id"
  add_index "products_dvd", ["dvd_buy_date"], :name => "dvd_buy_date"
  add_index "products_dvd", ["nbr_rotation_since_last_check"], :name => "rot_since_check"
  add_index "products_dvd", ["pibox_id"], :name => "pibox_id"
  add_index "products_dvd", ["products_dvd_status"], :name => "products_dvd_status"
  add_index "products_dvd", ["products_dvdid"], :name => "products_dvdid"
  add_index "products_dvd", ["products_id", "products_dvd_status", "inout", "box_id"], :name => "ProdID_Status_Inout_BoxID"
  add_index "products_dvd", ["products_id"], :name => "products_id"
  add_index "products_dvd", ["stock_type"], :name => "stock_type"

  create_table "products_dvd_sold", :primary_key => "products_dvd_sold_id", :force => true do |t|
    t.integer  "products_id",    :default => 0, :null => false
    t.integer  "products_dvdid", :default => 0, :null => false
    t.datetime "date_added",                    :null => false
  end

  create_table "products_dvd_state", :force => true do |t|
    t.string "name", :limit => 45, :null => false
  end

  create_table "products_dvd_state_history", :force => true do |t|
    t.integer   "products_id",     :null => false
    t.integer   "products_dvd_id", :null => false
    t.integer   "status",          :null => false
    t.integer   "type_process",    :null => false
    t.integer   "box_id",          :null => false
    t.integer   "pibox_id",        :null => false
    t.timestamp "date_added",      :null => false
    t.integer   "user_modified",   :null => false
    t.datetime  "last_modified",   :null => false
    t.integer   "inout"
    t.integer   "pick_group"
  end

  create_table "products_dvd_status", :id => false, :force => true do |t|
    t.integer "products_dvd_status_id",   :default => 0,  :null => false
    t.string  "products_dvd_status_name", :default => "", :null => false
    t.boolean "display",                                  :null => false
  end

  add_index "products_dvd_status", ["products_dvd_status_id"], :name => "products_dvd_status_id"

  create_table "products_dvd_status_history", :primary_key => "status_history_id", :force => true do |t|
    t.datetime "status_date"
    t.integer  "status_id",                        :default => 0, :null => false
    t.integer  "user_id",                          :default => 0, :null => false
    t.integer  "previous_status_id",               :default => 0
    t.string   "comment",            :limit => 45
    t.integer  "products_id",                      :default => 0, :null => false
    t.integer  "products_dvdid",                   :default => 0, :null => false
  end

  add_index "products_dvd_status_history", ["status_date", "products_id", "products_dvdid"], :name => "Index_searchdate"

  create_table "products_languages", :id => false, :force => true do |t|
    t.integer "languages_id",                        :default => 0, :null => false
    t.integer "languagenav_id",                      :default => 0, :null => false
    t.string  "languages_description", :limit => 50
    t.string  "short"
    t.string  "short_alpha"
  end

  create_table "products_rating", :primary_key => "products_rating_id", :force => true do |t|
    t.integer  "products_id",                        :default => 0, :null => false
    t.integer  "products_rating",                    :default => 0, :null => false
    t.datetime "products_rating_date",                              :null => false
    t.integer  "customers_id"
    t.string   "rating_type",          :limit => 45
    t.integer  "imdb_id",                            :default => 0, :null => false
    t.integer  "criteo_status",                      :default => 0, :null => false
  end

  add_index "products_rating", ["customers_id", "rating_type"], :name => "customer_type"
  add_index "products_rating", ["customers_id"], :name => "customers_id"
  add_index "products_rating", ["products_id", "rating_type"], :name => "product_type"
  add_index "products_rating", ["products_id"], :name => "products_id"
  add_index "products_rating", ["products_rating"], :name => "products_rating"
  add_index "products_rating", ["products_rating_date"], :name => "products_rating_date"

  create_table "products_recommandation", :primary_key => "products_recommandation_id", :force => true do |t|
    t.integer "customers_id", :default => 0, :null => false
    t.integer "products_id",  :default => 0, :null => false
    t.integer "correlation",  :default => 0, :null => false
    t.integer "context",      :default => 0, :null => false
  end

  add_index "products_recommandation", ["customers_id"], :name => "customers_id"

  create_table "products_recommandation__context", :id => false, :force => true do |t|
    t.integer "context_id",   :default => 0,  :null => false
    t.string  "context_name", :default => "", :null => false
  end

  create_table "products_recommandation_rating", :id => false, :force => true do |t|
    t.integer "customers_id", :default => 0, :null => false
    t.integer "products_id",  :default => 0, :null => false
    t.integer "correlation",  :default => 0, :null => false
  end

  add_index "products_recommandation_rating", ["correlation"], :name => "correlation"
  add_index "products_recommandation_rating", ["customers_id"], :name => "customers_id"

  create_table "products_recommandation_review", :id => false, :force => true do |t|
    t.integer "customers_id", :default => 0, :null => false
    t.integer "products_id",  :default => 0, :null => false
    t.integer "correlation",  :default => 0, :null => false
  end

  create_table "products_recommandations_control", :primary_key => "products_recommandations_control_id", :force => true do |t|
    t.string   "action",    :default => "", :null => false
    t.datetime "datebegin",                 :null => false
    t.datetime "dateend",                   :null => false
  end

  create_table "products_recommandations_control_customers", :primary_key => "products_recommandations_control_customers_id", :force => true do |t|
    t.integer  "customers_id",  :default => 0, :null => false
    t.datetime "date_started"
    t.datetime "date_finished"
  end

  create_table "products_recommandationstat", :id => false, :force => true do |t|
    t.integer "customers_id",    :default => 0, :null => false
    t.integer "recommandations", :default => 0, :null => false
  end

  create_table "products_seen", :id => false, :force => true do |t|
    t.integer  "product_id"
    t.integer  "customer_id"
    t.datetime "created_at"
  end

  add_index "products_seen", ["product_id", "customer_id"], :name => "test"

  create_table "products_similarities", :id => false, :force => true do |t|
    t.integer "products_id",  :default => 0, :null => false
    t.integer "products_id2", :default => 0, :null => false
    t.integer "context",      :default => 0, :null => false
    t.integer "correlation",  :default => 0, :null => false
  end

  add_index "products_similarities", ["products_id"], :name => "products_id"

  create_table "products_similarities__context", :id => false, :force => true do |t|
    t.integer "context_id",   :default => 0,  :null => false
    t.string  "context_name", :default => "", :null => false
  end

  create_table "products_similarities_actors", :id => false, :force => true do |t|
    t.integer "products_id",  :default => 0, :null => false
    t.integer "products_id2", :default => 0, :null => false
    t.integer "correlation",  :default => 0, :null => false
  end

  add_index "products_similarities_actors", ["products_id"], :name => "products_id"

  create_table "products_similarities_directors", :id => false, :force => true do |t|
    t.integer "products_id",  :default => 0, :null => false
    t.integer "products_id2", :default => 0, :null => false
    t.integer "correlation",  :default => 0, :null => false
  end

  add_index "products_similarities_directors", ["products_id"], :name => "products_id"

  create_table "products_similarities_next", :id => false, :force => true do |t|
    t.integer "products_id",  :default => 0, :null => false
    t.integer "products_id2", :default => 0, :null => false
    t.integer "correlation",  :default => 0, :null => false
  end

  add_index "products_similarities_next", ["products_id"], :name => "products_id"

  create_table "products_similarities_oneshot", :id => false, :force => true do |t|
    t.integer "products_id",  :default => 0, :null => false
    t.integer "products_id2", :default => 0, :null => false
    t.integer "correlation",  :default => 0, :null => false
  end

  add_index "products_similarities_oneshot", ["products_id"], :name => "products_id"

  create_table "products_similarities_wishlist", :id => false, :force => true do |t|
    t.integer "products_id",  :default => 0, :null => false
    t.integer "products_id2", :default => 0, :null => false
    t.integer "correlation",  :default => 0, :null => false
  end

  create_table "products_similaritiesstat", :id => false, :force => true do |t|
    t.integer "products_id",  :default => 0, :null => false
    t.integer "similarities", :default => 0, :null => false
  end

  create_table "products_soundtracks", :id => false, :force => true do |t|
    t.integer "soundtracks_id",                        :default => 0,  :null => false
    t.integer "language_id",                           :default => 0,  :null => false
    t.string  "soundtracks_description", :limit => 50, :default => "", :null => false
  end

  create_table "products_to_actors", :id => false, :force => true do |t|
    t.integer "products_id", :default => 0, :null => false
    t.integer "actors_id",   :default => 0, :null => false
  end

  create_table "products_to_categories", :id => false, :force => true do |t|
    t.integer   "products_id",   :default => 0, :null => false
    t.integer   "categories_id", :default => 0, :null => false
    t.timestamp "created_at",                   :null => false
  end

  add_index "products_to_categories", ["categories_id"], :name => "categories_id"

  create_table "products_to_languages", :id => false, :force => true do |t|
    t.integer "products_id",           :default => 0, :null => false
    t.integer "products_languages_id", :default => 0, :null => false
  end

  create_table "products_to_soundtracks", :id => false, :force => true do |t|
    t.integer "products_id",             :default => 0, :null => false
    t.integer "products_soundtracks_id", :default => 0, :null => false
  end

  create_table "products_to_themes", :id => false, :force => true do |t|
    t.integer "products_id", :default => 0, :null => false
    t.integer "themes_id",   :default => 0, :null => false
  end

  create_table "products_to_undertitles", :id => false, :force => true do |t|
    t.integer "products_id",             :default => 0, :null => false
    t.integer "products_undertitles_id", :default => 0, :null => false
  end

  create_table "products_trailers", :primary_key => "trailers_id", :force => true do |t|
    t.integer   "products_id",               :default => 0,             :null => false
    t.text      "trailer",                                              :null => false
    t.integer   "language_id",               :default => 0,             :null => false
    t.string    "broadcast",   :limit => 40, :default => "DAYLYMOTION", :null => false
    t.timestamp "created_at"
    t.boolean   "focus"
  end

  add_index "products_trailers", ["products_id"], :name => "products_trailer_idx"

  create_table "products_undertitles", :id => false, :force => true do |t|
    t.integer "undertitles_id",                        :default => 0,  :null => false
    t.integer "language_id",                           :default => 0,  :null => false
    t.string  "undertitles_description", :limit => 50, :default => "", :null => false
    t.string  "short"
    t.string  "short_alpha"
  end

  create_table "products_uninterested", :primary_key => "products_uninterested_id", :force => true do |t|
    t.integer  "products_id",  :default => 0, :null => false
    t.datetime "date",                        :null => false
    t.integer  "customers_id"
  end

  add_index "products_uninterested", ["customers_id"], :name => "customers_id"
  add_index "products_uninterested", ["products_id"], :name => "products_id"

  create_table "prospects", :id => false, :force => true do |t|
    t.integer "customers_id",                          :default => 0,     :null => false
    t.string  "customers_firstname",     :limit => 32, :default => "",    :null => false
    t.string  "customers_lastname",      :limit => 32, :default => "",    :null => false
    t.string  "customers_email_address", :limit => 96, :default => "",    :null => false
    t.integer "customers_language",                    :default => 0,     :null => false
    t.string  "site",                    :limit => 60, :default => "www", :null => false
    t.integer "EntityID",                              :default => 1,     :null => false
    t.integer "players",                               :default => 0,     :null => false
    t.string  "selected_for_email",      :limit => 80, :default => "0",   :null => false
    t.integer "unsubscribe",                           :default => 0,     :null => false
    t.integer "is_email_valid",                        :default => 0,     :null => false
    t.integer "last_email_sended",                     :default => 0,     :null => false
    t.integer "zip"
    t.string  "birthday",                :limit => 15
    t.string  "gender",                  :limit => 0,  :default => "I"
  end

  add_index "prospects", ["customers_email_address"], :name => "customers_email_address", :unique => true

  create_table "public", :id => false, :force => true do |t|
    t.integer "public_id",                 :default => 0,  :null => false
    t.integer "language_id",               :default => 0,  :null => false
    t.string  "public_name", :limit => 50, :default => "", :null => false
  end

# Could not dump table "quizz" because of following ArgumentError
#   invalid byte sequence in UTF-8

# Could not dump table "quizz_creator" because of following ArgumentError
#   invalid byte sequence in UTF-8

  create_table "quizz_details", :force => true do |t|
    t.integer "quizz_id",                  :null => false
    t.string  "property",    :limit => 20, :null => false
    t.string  "value",                     :null => false
    t.integer "language_id",               :null => false
  end

# Could not dump table "quizz_name" because of following ArgumentError
#   invalid byte sequence in UTF-8

  create_table "quotations", :primary_key => "quotations_id", :force => true do |t|
    t.datetime "quotation_date",                                                   :null => false
    t.integer  "suppliers_id",                                    :default => 0,   :null => false
    t.integer  "products_id",                                     :default => 0,   :null => false
    t.string   "products_name",                                   :default => "",  :null => false
    t.string   "products_options",                                :default => "",  :null => false
    t.date     "availability_date"
    t.decimal  "price",             :precision => 5, :scale => 2, :default => 0.0, :null => false
  end

  create_table "quotations_options", :primary_key => "options_id", :force => true do |t|
    t.string "options_name", :default => "", :null => false
  end

  create_table "red_list", :primary_key => "red_list_id", :force => true do |t|
    t.integer  "action",       :default => 0, :null => false
    t.integer  "customers_id", :default => 0, :null => false
    t.integer  "login_id",     :default => 0, :null => false
    t.datetime "date",                        :null => false
    t.text     "comment",                     :null => false
  end

  create_table "reviews", :primary_key => "reviews_id", :force => true do |t|
    t.integer  "products_id",                         :default => 0,  :null => false
    t.integer  "customers_id"
    t.string   "customers_name",        :limit => 64, :default => "", :null => false
    t.integer  "reviews_rating"
    t.datetime "date_added"
    t.datetime "last_modified"
    t.integer  "reviews_read",                        :default => 0,  :null => false
    t.integer  "reviews_check",                       :default => 0,  :null => false
    t.integer  "reviews_corrected",                   :default => 0,  :null => false
    t.integer  "customers_best_rating",               :default => 0,  :null => false
    t.integer  "customers_bad_rating",                :default => 0,  :null => false
    t.integer  "languages_id",                        :default => 0,  :null => false
    t.text     "reviews_text",                                        :null => false
    t.integer  "dvdpost_rating"
  end

  add_index "reviews", ["customers_id"], :name => "customers_id"
  add_index "reviews", ["languages_id"], :name => "languages_id"
  add_index "reviews", ["products_id"], :name => "products_id"
  add_index "reviews", ["reviews_check"], :name => "reviews_check"

# Could not dump table "reviews_rating" because of following ArgumentError
#   invalid byte sequence in UTF-8

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["id"], :name => "index_roles_on_id"

  create_table "saisons", :primary_key => "saisons_id", :force => true do |t|
    t.integer "series_id",                 :null => false
    t.string  "saison_name", :limit => 45, :null => false
    t.integer "order",                     :null => false
  end

  create_table "scheduler_mail", :primary_key => "scheduler_mail_id", :force => true do |t|
    t.integer   "mail_id",                           :null => false
    t.timestamp "date_added",                        :null => false
    t.datetime  "date_last_execution"
    t.integer   "frequencyDays",                     :null => false
    t.integer   "hour_executed",                     :null => false
    t.string    "script_php",          :limit => 45, :null => false
    t.datetime  "last_modifed",                      :null => false
    t.integer   "user_modified",                     :null => false
  end

  create_table "scheduler_mail_history", :primary_key => "scheduler_mail_history_id", :force => true do |t|
    t.integer   "scheduler_mail_id",                 :null => false
    t.integer   "mail_id",                           :null => false
    t.timestamp "date_added",                        :null => false
    t.datetime  "date_last_execution"
    t.integer   "frequencyDays",                     :null => false
    t.integer   "hour_executed",                     :null => false
    t.integer   "cpt_mail_sent",                     :null => false
    t.string    "script_php",          :limit => 45, :null => false
    t.datetime  "last_modifed",                      :null => false
    t.integer   "user_modified",                     :null => false
  end

  create_table "securitymenu_role", :id => false, :force => true do |t|
    t.integer "RoleID", :default => 0, :null => false
    t.integer "MenuID", :default => 0, :null => false
  end

  add_index "securitymenu_role", ["MenuID"], :name => "FK_SecurityMenu_Role_SystemMenu"

  create_table "securityrole", :primary_key => "RoleID", :force => true do |t|
    t.integer "EntityID",                            :default => 0, :null => false
    t.string  "Name",                 :limit => 50
    t.string  "Description",          :limit => 100
    t.integer "CanModifyGlobalViews"
  end

  add_index "securityrole", ["EntityID", "Name"], :name => "IX_SystemRole", :unique => true

  create_table "securityrole_entity", :id => false, :force => true do |t|
    t.integer "RoleID",   :default => 0, :null => false
    t.integer "EntityID", :default => 0, :null => false
  end

  add_index "securityrole_entity", ["EntityID"], :name => "IX_SecurityRole_Entity_1"
  add_index "securityrole_entity", ["RoleID"], :name => "IX_SecurityRole_Entity"

  create_table "securityshortcut", :primary_key => "ShortCutID", :force => true do |t|
    t.string  "Name",              :limit => 50
    t.integer "EntityID"
    t.string  "Description",       :limit => 150
    t.integer "AddKey"
    t.integer "AddKeyModifier"
    t.integer "EditKey"
    t.integer "EditKeyModifier"
    t.integer "DeleteKey"
    t.integer "DeleteKeyModifier"
    t.integer "SaveKey"
    t.integer "SaveKeyModifier"
    t.integer "UndoKey"
    t.integer "UndoKeyModifier"
    t.integer "HelpKey"
    t.integer "HelpKeyModifier"
  end

  add_index "securityshortcut", ["EntityID", "Name"], :name => "IX_SecurityShortCut", :unique => true

  create_table "securityshortcutsub", :id => false, :force => true do |t|
    t.integer "ShortCutID",                :default => 0,  :null => false
    t.string  "Type",        :limit => 10, :default => "", :null => false
    t.integer "ShortKey"
    t.integer "ModifierKey"
  end

  create_table "securityuser", :primary_key => "UserID", :force => true do |t|
    t.string  "FullName",      :limit => 100
    t.string  "Login",         :limit => 50
    t.string  "PassWord",      :limit => 50
    t.integer "ShortCutID"
    t.string  "Lang",          :limit => 2
    t.integer "DefaultRoleID"
    t.boolean "BannerVisible"
    t.integer "AutoSaveViews"
    t.boolean "ShowInTaskBar"
    t.boolean "AutoHideMenu"
    t.string  "UserDocPath",   :limit => 200
    t.integer "OrderLocID"
    t.integer "customers_id"
    t.integer "box_id"
    t.boolean "isencrypt",                    :null => false
  end

  add_index "securityuser", ["Login"], :name => "IX_SecurityUser", :unique => true

  create_table "securityuser_log", :primary_key => "user_log_id", :force => true do |t|
    t.integer  "UserID",                     :default => 0, :null => false
    t.datetime "LogDate"
    t.integer  "products_id"
    t.integer  "dvd_id"
    t.integer  "customers_id"
    t.string   "Log_Type",     :limit => 45
  end

  add_index "securityuser_log", ["LogDate"], :name => "LogDate"
  add_index "securityuser_log", ["UserID", "LogDate"], :name => "User_Date"
  add_index "securityuser_log", ["UserID"], :name => "UserID"

  create_table "securityuser_role", :id => false, :force => true do |t|
    t.integer "UserId", :default => 0, :null => false
    t.integer "RoleID", :default => 0, :null => false
  end

  add_index "securityuser_role", ["RoleID", "UserId"], :name => "IX_SecurityUser_Role", :unique => true

  create_table "securityusermenu", :id => false, :force => true do |t|
    t.integer "UserID",           :default => 0, :null => false
    t.integer "MenuID",           :default => 0, :null => false
    t.integer "ShortCutKey"
    t.integer "ShortCutModifier"
  end

  add_index "securityusermenu", ["MenuID", "UserID"], :name => "IX_SecurityUserMenu", :unique => true

  create_table "series", :primary_key => "series_id", :force => true do |t|
    t.string  "series_name",    :default => "", :null => false
    t.integer "parent_id"
    t.integer "series_type_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "shopping_box", :primary_key => "shopping_box_id", :force => true do |t|
    t.string   "box_name",                                       :default => "",  :null => false
    t.decimal  "sale_price",       :precision => 5, :scale => 2, :default => 0.0, :null => false
    t.integer  "quantity_to_sale",                               :default => 0,   :null => false
    t.integer  "nbr_items",                                      :default => 0,   :null => false
    t.datetime "box_sale_date",                                                   :null => false
  end

  create_table "shopping_box_description", :id => false, :force => true do |t|
    t.integer "shopping_box_id",          :default => 0,  :null => false
    t.integer "language_id",              :default => 0,  :null => false
    t.string  "shopping_box_name",        :default => "", :null => false
    t.text    "shopping_box_description",                 :null => false
  end

  create_table "shopping_box_products_id", :id => false, :force => true do |t|
    t.integer "shopping_box_id", :default => 0, :null => false
    t.integer "products_id",     :default => 0, :null => false
  end

  create_table "shopping_cart", :primary_key => "shopping_cart_id", :force => true do |t|
    t.integer  "customers_id",                                                 :default => 0,   :null => false
    t.integer  "products_id",                                                  :default => 0,   :null => false
    t.integer  "shopping_box_id",                                              :default => 0,   :null => false
    t.integer  "quantity",                                                     :default => 0,   :null => false
    t.decimal  "price",                         :precision => 15, :scale => 2, :default => 0.0, :null => false
    t.datetime "date_added"
    t.string   "products_type",   :limit => 20
  end

  create_table "shopping_cart_new", :primary_key => "shopping_cart_id", :force => true do |t|
    t.integer  "customers_id",                                               :default => 0,   :null => false
    t.integer  "products_id",                                                :default => 0,   :null => false
    t.integer  "quantity",                                                   :default => 0,   :null => false
    t.decimal  "price",                       :precision => 15, :scale => 2, :default => 0.0, :null => false
    t.datetime "date_added"
    t.string   "Products_type", :limit => 55,                                :default => "",  :null => false
  end

  create_table "shopping_discount", :primary_key => "shopping_discount_id", :force => true do |t|
    t.string  "discount_code",    :limit => 50,                               :default => "",  :null => false
    t.integer "discount_type",                                                :default => 0,   :null => false
    t.decimal "discount_value",                 :precision => 6, :scale => 2, :default => 0.0, :null => false
    t.integer "discount_status",                                              :default => 0,   :null => false
    t.string  "discount_text_fr",                                             :default => "",  :null => false
    t.string  "discount_text_nl",                                             :default => "",  :null => false
    t.string  "discount_text_en",                                             :default => "",  :null => false
    t.date    "validity_to"
  end

  create_table "shopping_orders", :primary_key => "shopping_orders_id", :force => true do |t|
    t.integer  "customers_id",                                                 :default => 0,   :null => false
    t.datetime "date",                                                                          :null => false
    t.integer  "products_id",                                                  :default => 0,   :null => false
    t.integer  "quantity",                                                     :default => 0,   :null => false
    t.integer  "status",                                                       :default => 0,   :null => false
    t.integer  "dvd_id",                                                       :default => 0,   :null => false
    t.decimal  "price",                          :precision => 5, :scale => 2, :default => 0.0, :null => false
    t.integer  "discount_code_id",                                             :default => 0,   :null => false
    t.string   "products_type",    :limit => 20,                                                :null => false
    t.string   "products_state",   :limit => 15,                                                :null => false
    t.string   "order_id",         :limit => 50
  end

  add_index "shopping_orders", ["status"], :name => "Status"

  create_table "shopping_orders_dvd_id", :id => false, :force => true do |t|
    t.integer "shopping_orders_id", :default => 0, :null => false
    t.integer "products_id",        :default => 0, :null => false
    t.integer "dvd_id",             :default => 0, :null => false
  end

  add_index "shopping_orders_dvd_id", ["shopping_orders_id", "products_id"], :name => "orders_products"
  add_index "shopping_orders_dvd_id", ["shopping_orders_id"], :name => "shopping_orders_id"

  create_table "shopping_orders_new", :primary_key => "shopping_orders_id", :force => true do |t|
    t.integer  "customers_id",                               :default => 0,   :null => false
    t.datetime "date",                                                        :null => false
    t.integer  "products_id",                                :default => 0,   :null => false
    t.integer  "quantity",                                   :default => 0,   :null => false
    t.integer  "status",                                     :default => 0,   :null => false
    t.decimal  "price",        :precision => 5, :scale => 2, :default => 0.0, :null => false
  end

  create_table "shopping_orders_new_dvd_id", :id => false, :force => true do |t|
    t.integer "shopping_orders_id", :default => 0, :null => false
    t.integer "dvd_id",             :default => 0, :null => false
  end

  create_table "shopping_orders_new_status_history", :primary_key => "shopping_orders_status_history_id", :force => true do |t|
    t.integer  "shopping_orders_id", :default => 0, :null => false
    t.integer  "new_value",          :default => 0, :null => false
    t.integer  "old_value",          :default => 0, :null => false
    t.datetime "date_added",                        :null => false
  end

  create_table "shopping_orders_shipping_fee", :primary_key => "shopping_orders_shipping_fee_id", :force => true do |t|
    t.integer  "customers_id",                               :default => 0,   :null => false
    t.datetime "date",                                                        :null => false
    t.decimal  "shipping_fee", :precision => 5, :scale => 2, :default => 0.0, :null => false
  end

  create_table "shopping_orders_status", :id => false, :force => true do |t|
    t.integer "shopping_orders_status_id", :default => 0,  :null => false
    t.string  "status_name",               :default => "", :null => false
  end

  create_table "shopping_orders_status_history", :primary_key => "shopping_orders_status_history_id", :force => true do |t|
    t.integer  "shopping_orders_id", :default => 0, :null => false
    t.integer  "new_value",          :default => 0, :null => false
    t.integer  "old_value",          :default => 0, :null => false
    t.datetime "date_added",                        :null => false
  end

  create_table "site", :primary_key => "site_id", :force => true do |t|
    t.string  "site_name",                 :default => "",                                           :null => false
    t.string  "site_link",                 :default => "http://www.dvdpost.be",                      :null => false
    t.string  "logo",                      :default => "http://www.dvdpost.be/images/www3/logo.jpg", :null => false
    t.string  "mailto",      :limit => 50, :default => "info@dvdpost.be",                            :null => false
    t.integer "online",                    :default => 0,                                            :null => false
    t.integer "partnership",               :default => 0,                                            :null => false
    t.integer "country",                   :default => 0,                                            :null => false
    t.integer "group",                     :default => 0,                                            :null => false
    t.integer "entity",                    :default => 0,                                            :null => false
  end

  add_index "site", ["site_name"], :name => "site", :unique => true

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "specials", :primary_key => "specials_id", :force => true do |t|
    t.integer  "products_id",                                                :default => 0,   :null => false
    t.decimal  "specials_new_products_price", :precision => 15, :scale => 4, :default => 0.0, :null => false
    t.datetime "specials_date_added"
    t.datetime "specials_last_modified"
    t.datetime "expires_date"
    t.datetime "date_status_change"
    t.integer  "status",                                                     :default => 1,   :null => false
  end

  create_table "sponsoring", :primary_key => "sponsoring_id", :force => true do |t|
    t.integer  "customers_id",                        :default => 0,  :null => false
    t.datetime "sponsoring_date",                                     :null => false
    t.string   "email",                 :limit => 75, :default => "", :null => false
    t.integer  "sponsoring_language",                 :default => 0,  :null => false
    t.integer  "sponsoring_email_sent",               :default => 0,  :null => false
    t.integer  "unsubscribe",                         :default => 0,  :null => false
  end

  create_table "sponsoring_used", :primary_key => "sponsoring_used_id", :force => true do |t|
    t.datetime "date",                           :null => false
    t.integer  "father_id",       :default => 0, :null => false
    t.integer  "father_abo_type", :default => 0, :null => false
    t.integer  "son_id",          :default => 0, :null => false
    t.integer  "son_abo_type",    :default => 0, :null => false
    t.integer  "extra_days",      :default => 0, :null => false
    t.integer  "mail_sent",       :default => 0, :null => false
  end

  create_table "stat_vod", :id => false, :force => true do |t|
    t.integer  "id",                 :default => 0, :null => false
    t.datetime "created_at",                        :null => false
    t.integer  "uploaded"
    t.integer  "ok_actif"
    t.integer  "ok_inactif"
    t.integer  "filename_incorrect"
    t.integer  "imdb_not_found"
    t.integer  "total"
  end

  create_table "stop_phone_acti_reason", :primary_key => "stop_phone_id", :force => true do |t|
    t.string "reason", :limit => 50
  end

  create_table "streaming_codes", :force => true do |t|
    t.string   "name"
    t.boolean  "white_label",         :default => false
    t.integer  "activation_group_id"
    t.date     "expiration_at"
    t.datetime "used_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "streaming_codes", ["id"], :name => "index_streaming_codes_on_id"
  add_index "streaming_codes", ["name"], :name => "index_streaming_codes_on_name"

  create_table "streaming_products", :force => true do |t|
    t.integer  "imdb_id"
    t.string   "filename"
    t.date     "available_from"
    t.date     "expire_at"
    t.date     "available_backcatalogue_from"
    t.date     "expire_backcatalogue_at"
    t.boolean  "available"
    t.integer  "language_id"
    t.integer  "subtitle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "studio_id"
    t.string   "status",                       :limit => 0, :default => "ripped"
    t.string   "quality",                      :limit => 0
    t.string   "source",                       :limit => 0, :default => "SOFTLAYER"
    t.integer  "vod_support_id",                            :default => 1,           :null => false
    t.integer  "credits",                                   :default => 1,           :null => false
  end

  add_index "streaming_products", ["imdb_id"], :name => "index_imdb_id"

  create_table "streaming_products_free", :force => true do |t|
    t.integer  "imdb_id"
    t.date     "available_from"
    t.date     "expire_at"
    t.boolean  "available"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind",           :limit => 0
  end

  add_index "streaming_products_free", ["imdb_id"], :name => "index_streaming_products_free_on_imdb_id"

  create_table "streaming_products_subtitles", :force => true do |t|
    t.string "streaming_product_id"
    t.string "subtitle_id"
  end

  create_table "streaming_viewing_histories", :force => true do |t|
    t.integer  "streaming_product_id"
    t.integer  "token_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "quality",              :limit => 0
  end

  create_table "studio", :primary_key => "studio_id", :force => true do |t|
    t.string  "studio_name",  :limit => 50, :default => "",         :null => false
    t.string  "studio_type",  :limit => 10, :default => "DVD_NORM", :null => false
    t.integer "cost_for_new", :limit => 2,  :default => 1
    t.integer "cost",         :limit => 2,  :default => 1
    t.boolean "vod",                        :default => false
  end

  add_index "studio", ["studio_id", "studio_type"], :name => "studio_type"

  create_table "subscriptions", :primary_key => "subscriptions_id", :force => true do |t|
    t.string  "subscriptions_name",                                :default => "",  :null => false
    t.decimal "subscriptions_price", :precision => 5, :scale => 2, :default => 0.0, :null => false
    t.integer "subscriptions_kind",                                :default => 0,   :null => false
    t.integer "dvd_home",                                          :default => 0,   :null => false
    t.integer "dvd_credit",                                        :default => 0,   :null => false
  end

  create_table "subscriptions_description", :id => false, :force => true do |t|
    t.integer "subscriptions_id",          :default => 0,  :null => false
    t.integer "language_id",               :default => 0,  :null => false
    t.string  "subscriptions_name",        :default => "", :null => false
    t.text    "subscriptions_description",                 :null => false
  end

  create_table "subscriptions_kind", :id => false, :force => true do |t|
    t.integer "subscriptions_kind_id",          :default => 0,  :null => false
    t.string  "subscriptions_kind_description", :default => "", :null => false
  end

  create_table "suggestions", :primary_key => "suggestions_id", :force => true do |t|
    t.integer  "customers_id",      :default => 0, :null => false
    t.integer  "language_id",       :default => 0, :null => false
    t.datetime "customer_date",                    :null => false
    t.text     "message",                          :null => false
    t.integer  "suggestion_status", :default => 0
  end

  create_table "suppliers", :primary_key => "suppliers_id", :force => true do |t|
    t.string "suppliers_name",                        :default => "", :null => false
    t.text   "suppliers_contact",                                     :null => false
    t.string "suppliers_orders_email", :limit => 100, :default => "", :null => false
  end

  create_table "survey_details", :force => true do |t|
    t.integer  "survey_id"
    t.integer  "reference_id"
    t.integer  "rating",       :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "free_text_fr"
    t.string   "free_text_nl"
    t.string   "free_text_en"
  end

  create_table "survey_kinds", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", :force => true do |t|
    t.string   "title_fr"
    t.string   "title_nl"
    t.string   "title_en"
    t.integer  "survey_kind_id"
    t.integer  "total_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "themes_event_id", :default => 0
  end

  create_table "suspensions", :force => true do |t|
    t.integer  "customer_id",                                        :null => false
    t.string   "status",        :limit => 0, :default => "HOLIDAYS", :null => false
    t.datetime "date_added"
    t.datetime "date_end"
    t.datetime "last_modified"
    t.integer  "user_modified",                                      :null => false
  end

  create_table "systemcurrency", :primary_key => "CurrCode", :force => true do |t|
    t.string  "Description", :limit => 100
    t.integer "RndFact"
  end

  create_table "systemdatabase", :primary_key => "DBName", :force => true do |t|
    t.string "Description",      :limit => 50
    t.text   "ConnectionString", :limit => 16777215
    t.string "ConnType",         :limit => 10
  end

  create_table "systemfieldtranslation", :id => false, :force => true do |t|
    t.string "ViewName",  :limit => 50, :default => "", :null => false
    t.string "FieldName", :limit => 50, :default => "", :null => false
    t.string "Lang",      :limit => 2,  :default => "", :null => false
    t.string "Label",     :limit => 50
  end

  create_table "systemmenu", :primary_key => "MenuID", :force => true do |t|
    t.string  "MenuLabel",           :limit => 50
    t.string  "MenuForm",            :limit => 100
    t.string  "MenuIcon",            :limit => 100
    t.string  "MenuIconExpanded",    :limit => 100
    t.integer "MenuStartID"
    t.string  "MenuStartCode",       :limit => 50
    t.string  "BrowseTableName",     :limit => 150
    t.string  "BrowseIDField",       :limit => 150
    t.string  "BrowseNameField",     :limit => 150
    t.integer "BrowseToMaintMenuID"
    t.text    "BrowseWhereClause",   :limit => 16777215
    t.text    "BrowseOrderByClause", :limit => 16777215
    t.string  "MenuStartCode2",      :limit => 50
    t.string  "MenuAssembly",        :limit => 50
    t.boolean "MenuLandScape"
  end

  add_index "systemmenu", ["MenuStartID"], :name => "IX_SystemMenu", :unique => true

  create_table "systemmenusub", :id => false, :force => true do |t|
    t.integer "MenuID",    :default => 0, :null => false
    t.integer "SubMenuID", :default => 0, :null => false
  end

  add_index "systemmenusub", ["SubMenuID", "MenuID"], :name => "IX_SystemMenuSub", :unique => true

  create_table "systemmenutranslation", :id => false, :force => true do |t|
    t.integer "MenuID",                   :default => 0,  :null => false
    t.string  "Lang",      :limit => 2,   :default => "", :null => false
    t.string  "MenuLabel", :limit => 150
  end

  create_table "systemmenutree", :id => false, :force => true do |t|
    t.integer "ParentID", :default => 0, :null => false
    t.integer "MenuID",   :default => 0, :null => false
    t.integer "Sequence"
  end

  add_index "systemmenutree", ["MenuID", "ParentID"], :name => "IX_SystemMenuTree_1", :unique => true
  add_index "systemmenutree", ["ParentID", "MenuID"], :name => "IX_SystemMenuTree", :unique => true

  create_table "systemmessage", :id => false, :force => true do |t|
    t.integer "MessageID",                  :default => 0,  :null => false
    t.string  "Lang",        :limit => 2,   :default => "", :null => false
    t.string  "MessageBody", :limit => 150
  end

  create_table "systemsequence", :primary_key => "KeyName", :force => true do |t|
    t.integer "Nextvalue"
    t.integer "Increment", :default => 1
  end

  create_table "themes", :primary_key => "themes_id", :force => true do |t|
    t.string   "themes_image",  :limit => 64
    t.integer  "parent_id",                   :default => 0,    :null => false
    t.integer  "sort_order"
    t.datetime "date_added"
    t.datetime "last_modified"
    t.string   "themes_type",   :limit => 10, :default => "",   :null => false
    t.boolean  "active",                      :default => true
    t.integer  "size"
  end

  add_index "themes", ["parent_id"], :name => "idx_categories_parent_id"
  add_index "themes", ["themes_type"], :name => "idx_themes_type"

  create_table "themes_description", :id => false, :force => true do |t|
    t.integer "themes_id",                 :default => 0,  :null => false
    t.integer "language_id",               :default => 1,  :null => false
    t.string  "themes_name", :limit => 64, :default => "", :null => false
  end

  add_index "themes_description", ["themes_name"], :name => "idx_categories_name"

  create_table "themes_events", :force => true do |t|
    t.string  "name",                       :limit => 45,                        :null => false
    t.integer "themes_events_selection_id",               :default => 0
    t.integer "background_image",           :limit => 1,  :default => 1
    t.string  "background_color",           :limit => 10
    t.string  "background_attachment",      :limit => 0,  :default => "fixed"
    t.integer "banner_hp",                  :limit => 1,  :default => 1
    t.string  "color_hp",                   :limit => 10, :default => "#FFF"
    t.integer "banner_menu",                :limit => 1,  :default => 1
    t.string  "banner_menu_text_color",     :limit => 10, :default => "#303030"
    t.string  "page_border_color",          :limit => 10, :default => "#000000"
    t.integer "logo_image",                 :limit => 1,  :default => 0
    t.string  "style",                      :limit => 0,  :default => "normal",  :null => false
    t.string  "kind",                       :limit => 0,  :default => "normal"
  end

  create_table "themes_events_selections", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", :force => true do |t|
    t.integer  "customer_id"
    t.string   "title"
    t.integer  "category_ticket_id"
    t.boolean  "remove",             :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["customer_id"], :name => "customer_id"

  create_table "tmovie", :id => false, :force => true do |t|
    t.string  "movie_id",              :limit => 35,   :default => " "
    t.string  "name",                  :limit => 145,  :default => " "
    t.integer "imdb_id"
    t.integer "imdb_id_serie"
    t.integer "disk_id"
    t.integer "season_id"
    t.integer "product_fiche_type_id"
    t.integer "product_directors_id"
    t.string  "director",              :limit => 45
    t.string  "actor_list",            :limit => 400
    t.string  "studio",                :limit => 45
    t.integer "lenght"
    t.string  "category_list",         :limit => 145
    t.string  "country_list",          :limit => 445
    t.string  "public",                :limit => 45
    t.string  "official_web_site",     :limit => 1145
    t.string  "triler",                :limit => 45
    t.string  "sysnopsis",             :limit => 8000
    t.string  "picture",               :limit => 145
    t.string  "sound_details_list",    :limit => 145
    t.string  "subtitles_list",        :limit => 145
    t.integer "type_id"
    t.string  "movie_type",            :limit => 145
    t.string  "languages",             :limit => 45
  end

  create_table "token_ips", :force => true do |t|
    t.integer  "token_id"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tokens", :force => true do |t|
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.string   "code"
    t.integer  "imdb_id"
    t.integer  "count_ip",    :default => 2
  end

  create_table "translations", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "language_id"
    t.integer  "mail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_matchings", :force => true do |t|
    t.string "name", :limit => 45, :null => false
  end

  create_table "v_wishlist", :id => false, :force => true do |t|
    t.integer  "wl_id",                            :default => 0,    :null => false
    t.integer  "customers_id",                     :default => 0,    :null => false
    t.integer  "product_id",                       :default => 0,    :null => false
    t.integer  "rank",                             :default => 0,    :null => false
    t.integer  "priority",                         :default => 2,    :null => false
    t.datetime "date_added",                                         :null => false
    t.string   "wishlist_type",      :limit => 45, :default => "",   :null => false
    t.integer  "wishlist_master_id",               :default => 1,    :null => false
    t.string   "already_rented",     :limit => 0,  :default => "NO", :null => false
  end

  create_table "view_delay_back_all", :id => false, :force => true do |t|
    t.string  "collect_platform", :default => "", :null => false
    t.integer "delay_back",       :default => 0,  :null => false
  end

# Could not dump table "vmovie" because of following StandardError
#   Unknown type 'null' for column 'Triler'

  create_table "vod_support", :force => true do |t|
    t.string "name", :limit => 45, :null => false
  end

  create_table "vod_wishlists", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "imdb_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vod_wishlists", ["customer_id"], :name => "index_vod_wishlists_on_customer_id"
  add_index "vod_wishlists", ["imdb_id"], :name => "index_vod_wishlists_on_imdb_id"

  create_table "wishlist", :primary_key => "wl_id", :force => true do |t|
    t.integer  "customers_id",                     :default => 0,    :null => false
    t.integer  "product_id",                       :default => 0,    :null => false
    t.integer  "rank",                             :default => 0,    :null => false
    t.integer  "priority",                         :default => 2,    :null => false
    t.datetime "date_added",                                         :null => false
    t.string   "wishlist_type",      :limit => 45, :default => "",   :null => false
    t.integer  "wishlist_master_id",               :default => 1,    :null => false
    t.string   "already_rented",     :limit => 0,  :default => "NO", :null => false
    t.integer  "theme_event_id"
    t.integer  "wishlist_source_id",                                 :null => false
  end

  add_index "wishlist", ["customers_id", "product_id"], :name => "customers_id_2", :unique => true
  add_index "wishlist", ["customers_id", "wishlist_type"], :name => "customer_type"
  add_index "wishlist", ["customers_id"], :name => "customers_id"
  add_index "wishlist", ["product_id", "wishlist_type"], :name => "products_type"
  add_index "wishlist", ["product_id"], :name => "product_id"
  add_index "wishlist", ["product_id"], :name => "products_id"

  create_table "wishlist_assigned", :primary_key => "wl_assigned_id", :force => true do |t|
    t.integer  "wl_id"
    t.integer  "customers_id"
    t.integer  "products_id"
    t.integer  "rank"
    t.datetime "date_added",                                          :null => false
    t.datetime "date_assigned",                                       :null => false
    t.string   "wishlist_type",      :limit => 45
    t.boolean  "priority",                         :default => false, :null => false
    t.integer  "theme_event_id"
    t.integer  "wishlist_source_id",                                  :null => false
  end

  add_index "wishlist_assigned", ["customers_id", "wishlist_type"], :name => "customer_type"
  add_index "wishlist_assigned", ["customers_id"], :name => "customers_id"
  add_index "wishlist_assigned", ["date_assigned", "wishlist_type"], :name => "date_type"
  add_index "wishlist_assigned", ["products_id", "wishlist_type"], :name => "product_type"
  add_index "wishlist_assigned", ["products_id"], :name => "products_id"
  add_index "wishlist_assigned", ["rank"], :name => "Index_rank"
  add_index "wishlist_assigned", ["wl_id"], :name => "wl_id"

  create_table "wishlist_sources", :force => true do |t|
    t.string   "name",       :limit => 45, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

end
