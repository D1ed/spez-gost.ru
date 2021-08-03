<?php
/**
 * @author    p0v1n0m <support@lutylab.ru>
 * @license   Commercial
 * @link      https://lutylab.ru
 */
// Heading
$_['heading_title']           = '</> СДЭК [обмен]';
$_['heading_title_order']     = '</> СДЭК [обмен]: заказы';
$_['heading_title_send']      = '</> СДЭК [обмен]: создание отправления';
$_['heading_title_view']      = '</> СДЭК [обмен]: просмотр отправления';
$_['heading_title_courier']   = '</> СДЭК [обмен]: вызов курьера';
$_['heading_license']         = 'Активация модуля';

// Button
$_['button_order']            = 'Заказы';
$_['button_exchange']         = 'Обмен';
$_['button_shipping']         = 'Доставка';
$_['button_cancel']           = 'Отменить';
$_['button_save']             = 'Сохранить';
$_['button_add']              = 'Добавить';
$_['button_remove']           = 'Удалить';
$_['button_create']           = 'Создать';
$_['button_view']             = 'Посмотреть';
$_['button_export']           = 'Отправить';
$_['button_update']           = 'Обновить статусы';
$_['button_invoice']          = 'Распечатать квитанцию';
$_['button_sticker']          = 'Распечатать этикетку';
$_['button_torg']             = 'Распечатать ТОРГ-12';
$_['button_email']            = 'Документы на email';
$_['button_courier']          = 'Вызвать курьера';
$_['button_call']             = 'Зарегистрировать прозвон';
$_['button_delete']           = 'Очистить';
$_['button_delete_db']        = 'Удалить';
$_['button_edit']             = 'Изменить';
$_['button_load']             = 'Загрузить';
$_['button_download']         = 'Скачать';
$_['button_clear']            = 'Очистить';
$_['button_filter']           = 'Фильтр';
$_['button_check']            = 'Проверить';

// Column
$_['column_id']               = 'Заказ';
$_['column_to']               = 'Куда';
$_['column_total']            = 'Стоимость';
$_['column_date']             = 'Дата заказа';
$_['column_order_status']     = 'Статус заказа';
$_['column_customer']         = 'Покупатель';
$_['column_tariff']           = 'Тариф';
$_['column_dispatch']         = 'Номер СДЭК';
$_['column_status']           = 'Статус СДЭК';
$_['column_notify']           = 'Уведомления';
$_['column_start']            = 'Статус запуска';
$_['column_stop']             = 'Статус отмены';
$_['column_delay']            = 'Задержка';

// Tab
$_['tab_api']                 = 'API';
$_['tab_setting']             = 'Общее';
$_['tab_file']                = 'Документы';
$_['tab_preset']              = 'Отправление';
$_['tab_merge']               = 'Объединение';
$_['tab_tracking']            = 'Трекинг';
$_['tab_alert']               = 'Уведомления';
$_['tab_sms']                 = 'SMS';
$_['tab_cron']                = 'Cron';
$_['tab_log']                 = 'Лог';
$_['tab_support']             = 'Поддержка';

// Text
$_['text_extension']          = 'Модули';
$_['text_success']            = 'Настройки успешно изменены!';
$_['text_success_clear']      = 'Лог успешно очищен!';
$_['text_success_change_dn']  = 'Номер заказа СДЭК успешно изменен!';
$_['text_export_success']     = 'Заказ № <strong>%s</strong> был успешно отправлен! ';
$_['text_update_success']     = 'Заказ № <strong>%s</strong> был успешно обновлен!';
$_['text_updates_success']    = 'Статусы выбранных заказов успешно обновлены!';
$_['text_courier_success']    = 'Заявка на вызов курьера успешно отправлена!';
$_['text_remove_success']     = 'Заказ № <strong>%s</strong> успешно очищен! Теперь его можно отправлять заново.';
$_['text_remove_db_success']  = 'Заказ № <strong>%s</strong> успешно удален из базы модуля!';
$_['text_prefix']             = 'Префикс';
$_['text_postfix']            = 'Постфикс';
$_['text_email']              = 'Email';
$_['text_site']               = 'Разработчик';
$_['text_docs']               = 'Документация';
$_['text_service']            = 'Сервис API';
$_['text_api_docs']           = 'Документация API';
$_['text_order']              = 'Заказ';
$_['text_yes']                = 'Да';
$_['text_no']                 = 'Нет';
$_['text_notify']             = 'Стандартное уведомление';
$_['text_notify_email']       = 'Email покупателю';
$_['text_notify_sms']         = 'SMS покупателю';
$_['text_day']                = 'дней';
$_['text_clean_confirm']      = 'Вы уверены, что хотите очистить отправление? В этом случае все статусы и номер СДЭК будут очищены, заказ можно будет отправить заново, но с новым номером.';
$_['text_remove_confirm']     = 'Вы уверены, что хотите удалить заказ из базы модуля? Процесс необратим и вы больше не сможете отправить этот заказ или вернуть его в этот список.';
$_['text_color_good']         = 'success';
$_['text_color_neutral']      = 'info';
$_['text_color_bad']          = 'danger';
$_['text_color_invalid']      = 'warning';
$_['text_email_invoice']      = '<a href="%s">Квитанция</a><br><br>';
$_['text_email_sticker']      = '<a href="%s">Этикетка</a><br><br>';
$_['text_email_torg']         = '<a href="%s">ТОРГ-12</a><br><br>';
$_['text_vats_product']       = 'Брать из товара, если значение налога равно 0% или 10% или 20%';

// Entry
$_['entry_api_login']         = 'Логин API';
$_['entry_api_key']           = 'Ключ API';
$_['entry_test']              = 'Тестовый режим';
$_['entry_timeout']           = 'Таймаут';
$_['entry_currency']          = 'Валюта договора';
$_['entry_cod']               = 'Наложенный платеж';
$_['entry_timezone']          = 'Часовой пояс';
$_['entry_service_count']     = 'Упаковка 1';
$_['entry_list_order_status'] = 'Отображать только заказы со статусами';
$_['entry_invoice_count']     = 'Число копий квитанции на листе';
$_['entry_sticker_count']     = 'Число копий этикетки на листе';
$_['entry_sticker_format']    = 'Формат печати этикеток';
$_['entry_files']             = 'Отправлять на email';
$_['entry_files_email']       = 'Email для отправки документов';
$_['entry_sms_gate']          = 'Шлюз';
$_['entry_sms_login']         = 'Логин';
$_['entry_sms_password']      = 'Пароль';
$_['entry_sms_sender']        = 'Отправитель';
$_['entry_cron_key']          = 'Ключ безопасности';
$_['entry_update_statuses']   = 'Отслеживать заказы со статусами';
$_['entry_update_day']        = 'Отслеживать заказы не старше';
$_['entry_update_url']        = 'Адрес отслеживания статусов';
$_['entry_update_pvz_url']    = 'Адрес обновления ПВЗ и постаматов';
$_['entry_logging']           = 'Логирование';
$_['entry_license']           = 'Ключ лицензии';
$_['entry_pvz']               = 'ПВЗ/постамат';
$_['entry_customer']          = 'Покупатель';
$_['entry_number']            = 'Номер ТТН';
$_['entry_merge']             = 'Автоматически объединять товары';
$_['entry_merge_name']        = 'Название общего товара';
$_['entry_merge_model']       = 'Артикул общего товара';
$_['entry_merge_link']        = 'Ссылка общего товара';
$_['entry_merge_vat']         = 'Ставка НДС общего товара';
$_['entry_merge_cost']        = 'Фиксированная страховка товара';
$_['entry_merge_cost_type']   = 'Фиксированная страховка для всех заказов';
$_['entry_merge_from_model']  = 'Объединять товары с одинаковым полем Модель';

// Help
$_['help_log']                = 'Нажмите Загрузить для отображения лога.';

// Error
$_['error_permission']        = 'У вас нет прав для изменения этого модуля или неверный ключ лицензии!';
$_['error_send']              = 'Заказ не выбран или уже отправлен!';
$_['error_update']            = 'Не удалось найти заказы для выбранного действия!';
$_['error_export']            = 'Не удалось создать отправление!';
$_['error_export_order']      = 'Заказ № <strong>%s</strong> не был отправлен по причине: <strong>%s</strong>! ';
$_['error_updates_order']     = 'Не удалось обновить статусы выбранных заказов!';
$_['error_update_order']      = 'Не удалось обновить статусы для заказа № <strong>%s</strong>!';
$_['error_invoices_order']    = 'Не удалось получить квитанции выбранных заказов!';
$_['error_invoice_order']     = 'Не удалось получить квитанцию для заказа № <strong>%s</strong>!';
$_['error_sticker_order']     = 'Не удалось получить этикетку для заказа № <strong>%s</strong>!';
$_['error_stickers_order']    = 'Не удалось получить этикетки выбранных заказов!';
$_['error_courier_order']     = 'Не удалось отправить заявку на вызов курьера!';
$_['error_pvz']               = ' - ПВЗ/постамат удален';
$_['error_log_file']          = 'Лог пуст!';
$_['error_log_weight']        = 'Лог слишком тяжелый, скачайте его и очистите!';
$_['error_checkclient']       = 'Модуль не установлен!';
