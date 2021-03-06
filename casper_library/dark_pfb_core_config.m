
function dark_pfb_core_config(this_block)

  % Revision History:
  %
  %   10-Jun-2015  (16:17 hours):
  %     Original code was machine generated by Xilinx's System Generator after parsing
  %     /home/kids/SDR/Firmware/components/dark_pfb_core/dark_pfb_core.vhd
  %
  %

  this_block.setTopLevelLanguage('VHDL');

  this_block.setEntityName('dark_pfb_core');

  % System Generator has to assume that your entity  has a combinational feed through; 
  %   if it  doesn't, then comment out the following line:
  this_block.tagAsCombinational;

  this_block.addSimulinkInport('data_i0');
  this_block.addSimulinkInport('data_i1');
  this_block.addSimulinkInport('data_i2');
  this_block.addSimulinkInport('data_i3');
  this_block.addSimulinkInport('data_i4');
  this_block.addSimulinkInport('data_i5');
  this_block.addSimulinkInport('data_i6');
  this_block.addSimulinkInport('data_i7');
  this_block.addSimulinkInport('data_q0');
  this_block.addSimulinkInport('data_q1');
  this_block.addSimulinkInport('data_q2');
  this_block.addSimulinkInport('data_q3');
  this_block.addSimulinkInport('data_q4');
  this_block.addSimulinkInport('data_q5');
  this_block.addSimulinkInport('data_q6');
  this_block.addSimulinkInport('data_q7');
  this_block.addSimulinkInport('sync_in');

  this_block.addSimulinkOutport('gateway_out');
  this_block.addSimulinkOutport('gateway_out1');

  gateway_out_port = this_block.port('gateway_out');
  gateway_out_port.setType('UFix_576_0');
  gateway_out1_port = this_block.port('gateway_out1');
  gateway_out1_port.setType('UFix_1_0');
  gateway_out1_port.useHDLVector(false);

  % -----------------------------
  if (this_block.inputTypesKnown)
    % do input type checking, dynamic output type and generic setup in this code block.

    if (this_block.port('data_i0').width ~= 12);
      this_block.setError('Input data type for port "data_i0" must have width=12.');
    end

    if (this_block.port('data_i1').width ~= 12);
      this_block.setError('Input data type for port "data_i1" must have width=12.');
    end

    if (this_block.port('data_i2').width ~= 12);
      this_block.setError('Input data type for port "data_i2" must have width=12.');
    end

    if (this_block.port('data_i3').width ~= 12);
      this_block.setError('Input data type for port "data_i3" must have width=12.');
    end

    if (this_block.port('data_i4').width ~= 12);
      this_block.setError('Input data type for port "data_i4" must have width=12.');
    end

    if (this_block.port('data_i5').width ~= 12);
      this_block.setError('Input data type for port "data_i5" must have width=12.');
    end

    if (this_block.port('data_i6').width ~= 12);
      this_block.setError('Input data type for port "data_i6" must have width=12.');
    end

    if (this_block.port('data_i7').width ~= 12);
      this_block.setError('Input data type for port "data_i7" must have width=12.');
    end

    if (this_block.port('data_q0').width ~= 12);
      this_block.setError('Input data type for port "data_q0" must have width=12.');
    end

    if (this_block.port('data_q1').width ~= 12);
      this_block.setError('Input data type for port "data_q1" must have width=12.');
    end

    if (this_block.port('data_q2').width ~= 12);
      this_block.setError('Input data type for port "data_q2" must have width=12.');
    end

    if (this_block.port('data_q3').width ~= 12);
      this_block.setError('Input data type for port "data_q3" must have width=12.');
    end

    if (this_block.port('data_q4').width ~= 12);
      this_block.setError('Input data type for port "data_q4" must have width=12.');
    end

    if (this_block.port('data_q5').width ~= 12);
      this_block.setError('Input data type for port "data_q5" must have width=12.');
    end

    if (this_block.port('data_q6').width ~= 12);
      this_block.setError('Input data type for port "data_q6" must have width=12.');
    end

    if (this_block.port('data_q7').width ~= 12);
      this_block.setError('Input data type for port "data_q7" must have width=12.');
    end

    if (this_block.port('sync_in').width ~= 1);
      this_block.setError('Input data type for port "sync_in" must have width=1.');
    end

    this_block.port('sync_in').useHDLVector(false);

  end  % if(inputTypesKnown)
  % -----------------------------

  % -----------------------------
   if (this_block.inputRatesKnown)
     setup_as_single_rate(this_block,'clk_1','ce_1')
   end  % if(inputRatesKnown)
  % -----------------------------

    % (!) Set the inout port rate to be the same as the first input 
    %     rate. Change the following code if this is untrue.
    uniqueInputRates = unique(this_block.getInputRates);


  % Add addtional source files as needed.
  %  |-------------
  %  | Add files in the order in which they should be compiled.
  %  | If two files "a.vhd" and "b.vhd" contain the entities
  %  | entity_a and entity_b, and entity_a contains a
  %  | component of type entity_b, the correct sequence of
  %  | addFile() calls would be:
  %  |    this_block.addFile('b.vhd');
  %  |    this_block.addFile('a.vhd');
  %  |-------------

  %    this_block.addFile('');
  %    this_block.addFile('');
  this_block.addFile('/home/kids/SDR/Firmware/components/dark_pfb_core/dark_pfb_core.vhd');

return;


% ------------------------------------------------------------

function setup_as_single_rate(block,clkname,cename) 
  inputRates = block.inputRates; 
  uniqueInputRates = unique(inputRates); 
  if (length(uniqueInputRates)==1 & uniqueInputRates(1)==Inf) 
    block.addError('The inputs to this block cannot all be constant.'); 
    return; 
  end 
  if (uniqueInputRates(end) == Inf) 
     hasConstantInput = true; 
     uniqueInputRates = uniqueInputRates(1:end-1); 
  end 
  if (length(uniqueInputRates) ~= 1) 
    block.addError('The inputs to this block must run at a single rate.'); 
    return; 
  end 
  theInputRate = uniqueInputRates(1); 
  for i = 1:block.numSimulinkOutports 
     block.outport(i).setRate(theInputRate); 
  end 
  block.addClkCEPair(clkname,cename,theInputRate); 
  return; 

% ------------------------------------------------------------

