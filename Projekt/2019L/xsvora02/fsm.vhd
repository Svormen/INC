-- fsm.vhd: Finite State Machine
-- Author(s): 
--
library ieee;
use ieee.std_logic_1164.all;
-- ----------------------------------------------------------------------------
--                        Entity declaration
-- ----------------------------------------------------------------------------
entity fsm is
port(
   CLK         : in  std_logic;
   RESET       : in  std_logic;

   -- Input signals
   KEY         : in  std_logic_vector(15 downto 0);
   CNT_OF      : in  std_logic;

   -- Output signals
   FSM_CNT_CE  : out std_logic;
   FSM_MX_MEM  : out std_logic;
   FSM_MX_LCD  : out std_logic;
   FSM_LCD_WR  : out std_logic;
   FSM_LCD_CLR : out std_logic
);
end entity fsm;

-- ----------------------------------------------------------------------------
--                      Architecture declaration
-- ----------------------------------------------------------------------------
architecture behavioral of fsm is
   type t_state is (TEST_START, TEST_ERROR, TEST1, TEST2, TEST3, TEST4, TEST5, TEST6, TEST11, TEST12, TEST13, TEST21, TEST22, TEST23, TEST24, PRINT_ERROR, PRINT_OK, FINISH);
   signal present_state, next_state : t_state;

begin
-- -------------------------------------------------------
sync_logic : process(RESET, CLK)
begin
   if (RESET = '1') then
      present_state <= TEST_START;
   elsif (CLK'event AND CLK = '1') then
      present_state <= next_state;
   end if;
end process sync_logic;

-- -------------------------------------------------------
next_state_logic : process(present_state, KEY, CNT_OF)
begin
   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_START =>
      next_state <= TEST_START;
		if (KEY(8) = '1') then
			next_state <= TEST1;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= TEST_ERROR;
      end if;
	-- - - - - - - - - - - - - - - - - - - - - - -
   when TEST1 =>
      next_state <= TEST1;
		if (KEY(9) = '1') then
			next_state <= TEST2;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= TEST_ERROR;
      end if;
	-- - - - - - - - - - - - - - - - - - - - - - -
   when TEST2 =>
      next_state <= TEST2;
		if (KEY(6) = '1') then
			next_state <= TEST3;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= TEST_ERROR;
      end if;
	-- - - - - - - - - - - - - - - - - - - - - - -
   when TEST3 =>
      next_state <= TEST3;
		if (KEY(0) = '1') then
			next_state <= TEST4;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= TEST_ERROR;
      end if;
	-- - - - - - - - - - - - - - - - - - - - - - -
   when TEST4 =>
      next_state <= TEST4;
		if (KEY(4) = '1') then
			next_state <= TEST5;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= TEST_ERROR;
      end if;
	-- - - - - - - - - - - - - - - - - - - - - - -
   when TEST5 =>
      next_state <= TEST5;
		if (KEY(6) = '1') then
			next_state <= TEST6;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= TEST_ERROR;
      end if;
	-- - - - - - - - - - - - - - - - - - - - - - -
   when TEST6 =>
      next_state <= TEST6;
		if (KEY(8) = '1') then
			next_state <= TEST11;
		elsif (KEY(7) = '1') then
			next_state <= TEST21;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= TEST_ERROR;
      end if;
	-- - - - - - - - - - - - - - - - - - - - - - -
   when TEST11 =>
      next_state <= TEST11;
		if (KEY(0) = '1') then
			next_state <= TEST12;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= TEST_ERROR;
      end if;
	-- - - - - - - - - - - - - - - - - - - - - - -
   when TEST12 =>
      next_state <= TEST12;
		if (KEY(3) = '1') then
			next_state <= TEST13;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= TEST_ERROR;
      end if;
	-- - - - - - - - - - - - - - - - - - - - - - -
   when TEST13 =>
      next_state <= TEST13;
      if (KEY(15) = '1') then
         next_state <= PRINT_OK; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= TEST_ERROR;
      end if;
	-- - - - - - - - - - - - - - - - - - - - - - -
   when TEST21 =>
      next_state <= TEST21;
		if (KEY(2) = '1') then
			next_state <= TEST22;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= TEST_ERROR;
      end if;
	-- - - - - - - - - - - - - - - - - - - - - - -
   when TEST22 =>
      next_state <= TEST22;
		if (KEY(1) = '1') then
			next_state <= TEST23;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= TEST_ERROR;
      end if;
	-- - - - - - - - - - - - - - - - - - - - - - -
   when TEST23 =>
      next_state <= TEST23;
		if (KEY(2) = '1') then
			next_state <= TEST24;
      elsif (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= TEST_ERROR;
      end if;
	-- - - - - - - - - - - - - - - - - - - - - - -
   when TEST24 =>
      next_state <= TEST24;
      if (KEY(15) = '1') then
         next_state <= PRINT_OK; 
		elsif (KEY(14 downto 0) /= "000000000000000") then
			next_state <= TEST_ERROR;
      end if;
	-- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_ERROR =>
      next_state <= TEST_ERROR;
      if (KEY(15) = '1') then
         next_state <= PRINT_ERROR; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_ERROR =>
      next_state <= PRINT_ERROR;
      if (CNT_OF = '1') then
         next_state <= FINISH;
      end if;
	-- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_OK =>
      next_state <= PRINT_OK;
      if (CNT_OF = '1') then
         next_state <= FINISH;
      end if;	
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      next_state <= FINISH;
      if (KEY(15) = '1') then
         next_state <= TEST_START; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
      next_state <= TEST_START;
   end case;
end process next_state_logic;

-- -------------------------------------------------------
output_logic : process(present_state, KEY)
begin
   FSM_CNT_CE     <= '0';
   FSM_MX_MEM     <= '0';
   FSM_MX_LCD     <= '0';
   FSM_LCD_WR     <= '0';
   FSM_LCD_CLR    <= '0';

   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST_START | TEST_ERROR | TEST1 | TEST2 | TEST3 | TEST4 | TEST5 | TEST6 | TEST11 | TEST12 | TEST13 | TEST21 | TEST22 | TEST23 | TEST24 =>
      if (KEY(14 downto 0) /= "000000000000000") then
         FSM_LCD_WR     <= '1';
      end if;
      if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_ERROR =>
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';
	-- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_OK =>
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';
		FSM_MX_MEM     <= '1';
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
   end case;
end process output_logic;

end architecture behavioral;

