function demux_init(blk, varargin)
% By Matt Strader
%
% demux_init(blk, varargin)
%
% blk = The block to configure.
% varargin = {'varname', 'value', ...} pairs
% 
% Declare any default values for arguments you might like.

clog('Entering demux_init','trace'); 
defaults = {'nOutputs', 4};
 
% if parameter is changed then only it will redraw otherwise will exit
if same_state(blk, 'defaults', defaults, varargin{:})
    return
end
clog('demux_init post same_state','trace'); 
% Checks whether the block selected is correct with this called function.
check_mask_type(blk, 'demux');
 
%Sets the variable to the sub-blocks (scripted ones), also checks whether
%to update or prevent from any update
munge_block(blk, varargin{:});
 
% sets the variable needed
nOutputs = get_var('nOutputs', 'defaults', defaults, varargin{:});
nBits = ceil(log2(nOutputs));
 
% Begin redrawing
delete_lines(blk);


% create inputs
reuse_block(blk,'in','built-in/Inport',...
                'Port', '1',...
                'Position',[0 370 30 370+20]) ; 

reuse_block(blk,'clear','built-in/Inport',...
                'Port', '2',...
                'Position',[0 320 30 320+20]) ; 

%dataOutPos = [syncOutX dataOutY syncOutX+syncOutW dataOutY+syncOutH];

for iOutput=1:nOutputs
    %create outputs
    reuse_block(blk,['out',num2str(iOutput-1)],'built-in/Outport',...
                'Port', num2str(iOutput),...
                'Position',[500 100*iOutput 500+30 (100*iOutput)+20]) ; 
    %add_line(blk,'in/1',['out',num2str(iOutput),'/1'],'autorouting','off');
end

reuse_block (blk,'clear_mux','xbsIndex_r4/Mux', 'Position', [100 300 100+30 300+150], 'inputs', '2','latency','1');
reuse_block(blk, 'clear_const', 'xbsIndex_r4/Constant', ...
    'const', num2str(nOutputs), 'arith_type', 'Unsigned', ...
    'n_bits', num2str(ceil(log2(nOutputs+1))), ...
    'bin_pt', '0', 'explicit_period', 'on', ...
    'Position',[0 400 0+50 400+50]);

add_line(blk,'clear/1','clear_mux/1','autorouting','off')
add_line(blk,'in/1','clear_mux/2','autorouting','off')
add_line(blk,'clear_const/1','clear_mux/3','autorouting','off')

for iOutput=1:nOutputs
    relationalName = ['relational',num2str(iOutput-1)];
    constName = ['const',num2str(iOutput-1)];
    reuse_block(blk, relationalName, 'xbsIndex_r4/Relational', ...
              'mode', 'a=b', 'latency', '1',...
              'Position', [300 100*iOutput 300+50 (100*iOutput)+50],...
              'en','off');

    reuse_block(blk, constName, 'xbsIndex_r4/Constant', ...
        'const', num2str(iOutput-1), 'arith_type', 'Unsigned', ...
        'n_bits', num2str(nBits), ...
        'bin_pt', '0', 'explicit_period', 'on', ...
        'Position',[200 100*iOutput+50 200+30 100*iOutput+50+30]);

    add_line(blk,[relationalName,'/1'],['out',num2str(iOutput-1),'/1'],'autorouting','off');
    add_line(blk,'clear_mux/1',[relationalName,'/1'],'autorouting','on');
    add_line(blk,[constName,'/1'],[relationalName,'/2'],'autorouting','off');
end

%create internal blocks

% clean out everything else
clean_blocks(blk);
 
%fmtstr = sprintf();
% Printing at the bottom of the block fmtstr = sprintf('Min
% Delay=%d',(n_inputs_bits + bram_latency+1); %
%set_param(blk, 'AttributesFormatString', fmtstr);
 
% Save all the variables just like global variables in C
save_state(blk, 'defaults', defaults, varargin{:});
clog('exiting demux_init','trace'); 
