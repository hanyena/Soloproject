CKEDITOR.editorConfig = function(config ) {
	config.language = 'ko';
	config.uiColor = '#EEEEEE';
	config.toolbarCanCollapse = true; 
    config.filebrowserUploadUrl = 'open/fileimageUpload';

	config.extraPlugins = 'autogrow';
	config.autoGrow_minHeight = 200;
	config.autoGrow_maxHeight = 500;
	config.autoGrow_bottomSpace = 50;
    config.toolbarGroups = [ { name: 'document',  groups: [ 'mode' ] }, 
                             { name: 'clipboard', groups: [ 'clipboard', 'undo' ] }, 
                             { name: 'editing',   groups: [ 'find', 'selection', 'spellchecker' ] },
                             '/',
                             { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
//                           { name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
                             { name: 'links',     groups: ['links',  'insert']}, 
//                           { name: 'tools' }, 
                             { name: 'colors' },
                             { name: 'about' }		
	];
};
